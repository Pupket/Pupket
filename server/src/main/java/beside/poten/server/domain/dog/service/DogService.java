package beside.poten.server.domain.dog.service;

import beside.poten.server.domain.dog.dto.DogProfileRequest;
import beside.poten.server.domain.dog.dto.DogProfileResponse;
import beside.poten.server.domain.dog.entity.Dog;
import beside.poten.server.domain.dog.repository.DogRepository;
import beside.poten.server.domain.user.service.FileService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;

@Service
@RequiredArgsConstructor
public class DogService {

    private final DogRepository dogRepository;
    private final FileService fileService;
    private final ModelMapper modelMapper;

    public DogProfileResponse registDogProfile(DogProfileRequest data) throws IOException {
        Dog dog = modelMapper.map(data, Dog.class);

        dogRepository.save(dog);

        return modelMapper.map(data, DogProfileResponse.class);
    }

    public DogProfileResponse findDogProfile(Long id) {
        return modelMapper.map(dogRepository.findByDogId(id), DogProfileResponse.class);
    }

    public DogProfileResponse modifyDogProfile(DogProfileRequest data, Long id) throws IOException {
        Dog dog = dogRepository.findByDogId(id);

        dogRepository.save(dog);

        return modelMapper.map(data, DogProfileResponse.class);
    }

    public String deleteDogProfile(Long id) {
        dogRepository.deleteByDogId(id);

        return "deleted successfully";
    }

    public String saveDogProfileImage(MultipartFile file) throws IOException {
        String newFileName = fileService.convertName(file.getOriginalFilename());
        String fileUrl = fileService.saveFile(file, newFileName);

        return fileUrl;
    }

    public String searchDogProfile(String id, HttpServletRequest data) throws IOException {
        return Arrays.toString(fileService.loadFileInS3(id, data));
    }

    public String deleteDogProfileImage(String id) throws BadRequestException {
        fileService.deleteFile(id);

        return "deleted successfully";
    }
}
