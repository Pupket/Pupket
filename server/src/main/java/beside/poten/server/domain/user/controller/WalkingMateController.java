package beside.poten.server.domain.user.controller;

import beside.poten.server.domain.dog.dto.DogProfileRequest;
import beside.poten.server.domain.dog.dto.DogProfileResponse;
import beside.poten.server.domain.user.dto.WalkingMateProfileRequest;
import beside.poten.server.domain.user.dto.WalkingMateProfileResponse;
import beside.poten.server.domain.user.service.MatingService;
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
@RequestMapping("/walkingmate")
@RequiredArgsConstructor
public class WalkingMateController {

    private final MatingService matingService;

    @PostMapping("/register")
    public ResponseEntity<WalkingMateProfileResponse> registerWalkingMateProfile(
            @RequestBody WalkingMateProfileRequest request
    ) throws IOException {
        return ResponseEntity.ok(matingService.registWalkingMateProfile(request));
    }

    @GetMapping("/{id}")
    public ResponseEntity<WalkingMateProfileResponse> findWalkingMateProfile(@PathVariable("id") Long id) {
        return ResponseEntity.ok(matingService.findWalkingMateProfile(id));
    }

    @PatchMapping("/{id}")
    public ResponseEntity<WalkingMateProfileResponse> modifyWalkingMateProfile(
            @RequestBody DogProfileRequest request,
            @PathVariable("id") Long id) throws IOException {
        return ResponseEntity.ok(matingService.modifyWalkingMateProfile(request, id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteWalkingMateProfile(@PathVariable("id") Long id) {
        return ResponseEntity.ok(matingService.deleteWalkingMateProfile(id));
    }

    @PostMapping(value = "image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> saveWalkingMateProfileImage(@RequestBody @Valid MultipartFile file) throws IOException {
        return ResponseEntity.ok(matingService.saveWalkingMateProfileImage(file));
    }

    @GetMapping("/image/{id}")
    public ResponseEntity<String> searchWalkingMateProfileImage(@RequestBody String id, HttpServletRequest request) throws IOException {
        return ResponseEntity.ok(matingService.searchWalkingMateProfile(id, request));
    }

    @DeleteMapping("/image/{id}")
    public ResponseEntity<String> deleteWalkingMateProfileImage(@RequestBody String id) throws IOException {
        return ResponseEntity.ok(matingService.deleteWalkingMateProfileImage(id));
    }
}
