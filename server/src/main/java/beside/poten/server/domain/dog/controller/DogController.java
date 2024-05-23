package beside.poten.server.domain.dog.controller;

import beside.poten.server.domain.dog.dto.DogProfileRequest;
import beside.poten.server.domain.dog.dto.DogProfileResponse;
import beside.poten.server.domain.dog.service.DogService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/api/v1/dog")
@RequiredArgsConstructor
public class DogController {

    private final DogService dogService;

    @PostMapping("/register")
    public ResponseEntity<DogProfileResponse> registerDogProfile(
            @RequestBody DogProfileRequest request
    ) throws IOException {
        return ResponseEntity.ok(dogService.registDogProfile(request));
    }

    @GetMapping("/{id}")
    public ResponseEntity<DogProfileResponse> findDogProfile(@PathVariable("id") Long id) {
        return ResponseEntity.ok(dogService.findDogProfile(id));
    }

    @PatchMapping("/{id}")
    public ResponseEntity<DogProfileResponse> modifyDogProfile(
            @RequestBody DogProfileRequest request,
            @PathVariable("id") Long id) throws IOException {
        return ResponseEntity.ok(dogService.modifyDogProfile(request, id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteDogProfile(@PathVariable("id") Long id) {
        return ResponseEntity.ok(dogService.deleteDogProfile(id));
    }

    @PostMapping(value = "image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> saveDogProfileImage(@RequestBody @Valid MultipartFile file) throws IOException {
        return ResponseEntity.ok(dogService.saveDogProfileImage(file));
    }

    @GetMapping("/image/{id}")
    public ResponseEntity<String> searchDogProfileImage(@RequestBody String id, HttpServletRequest request) throws IOException {
        return ResponseEntity.ok(dogService.searchDogProfile(id, request));
    }

    @DeleteMapping("/image/{id}")
    public ResponseEntity<String> deleteDogProfileImage(@RequestBody String id) throws BadRequestException {
        return ResponseEntity.ok(dogService.deleteDogProfileImage(id));
    }
}
