package beside.poten.server.domain.user.service;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class FileService {

    private final AmazonS3 amazonS3;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    public String convertName(String originName) {
        // UUID 생성
        String uuid = UUID.randomUUID().toString();
        // 파일 확장자 추출
        String extension = "";
        int dotIndex = originName.lastIndexOf('.');
        if (dotIndex > 0 && dotIndex < originName.length() - 1) {
            extension = originName.substring(dotIndex);
        }
        // 새로운 파일 이름 생성
        return uuid + extension;
    }


    //TODO:: 파일 유효성 검사
    public String saveFile(MultipartFile multipartFile, String newName) throws IOException {

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());

        amazonS3.putObject(bucket, newName, multipartFile.getInputStream(), metadata);
        return amazonS3.getUrl(bucket,newName).toString();
    }

    public byte[] loadFileInS3(String originalFilename, HttpServletRequest request) throws IOException {

        String currentPath = request.getRequestURI();
        log.info("currentPath ={}", currentPath);
        S3Object s3Object = amazonS3.getObject(bucket, originalFilename);


        S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();



        // header에 CONTENT_DISPOSITION 설정을 통해 클릭 시 다운로드 진행
        return  IOUtils.toByteArray(s3ObjectInputStream);
    }

    public void deleteFile(String originalFileName) throws BadRequestException {
        if (originalFileName != null) {

        amazonS3.deleteBucket(originalFileName);
        }else{
            throw new BadRequestException();
        }

    }


}
