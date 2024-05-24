package beside.poten.server.domain.user.service;

import beside.poten.server.domain.dog.dto.DogProfileRequest;
import beside.poten.server.domain.user.dto.WalkingMateProfileRequest;
import beside.poten.server.domain.user.dto.WalkingMateProfileResponse;
import beside.poten.server.domain.user.entity.WalkingMate;
import beside.poten.server.domain.user.repository.WalkingMateRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MatingService {

    private final WalkingMateRepository walkingMateRepository;
    private final FileService fileService;
    private final ModelMapper modelMapper;

    public WalkingMateProfileResponse registWalkingMateProfile(WalkingMateProfileRequest data) {
        WalkingMate walkingMate = modelMapper.map(data, WalkingMate.class);

        walkingMateRepository.save(walkingMate);

        return modelMapper.map(data, WalkingMateProfileResponse.class);
    }

    public WalkingMateProfileResponse findWalkingMateProfile(Long id) {
        return modelMapper.map(walkingMateRepository.findById(id), WalkingMateProfileResponse.class);
    }

    public WalkingMateProfileResponse modifyWalkingMateProfile(DogProfileRequest data, Long id) {
        Optional<WalkingMate> walkingMate = walkingMateRepository.findById(id);

        walkingMateRepository.save(walkingMate.get());

        return modelMapper.map(data, WalkingMateProfileResponse.class);
    }

    public String deleteWalkingMateProfile(Long id) {
        walkingMateRepository.deleteById(id);

        return "deleted successfully";
    }

    public String saveWalkingMateProfileImage(MultipartFile file) throws IOException {
        String newFileName = fileService.convertName(file.getOriginalFilename());
        String fileUrl = fileService.saveFile(file, newFileName);

        return fileUrl;
    }

    public String searchWalkingMateProfile(String id, HttpServletRequest data) throws IOException {
        return Arrays.toString(fileService.loadFileInS3(id, data));
    }

    public String deleteWalkingMateProfileImage(String id) throws IOException{
        fileService.deleteFile(id);

        return "deleted successfully";
    }
}
