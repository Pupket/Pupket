package beside.poten.server.domain.board.controller;

import beside.poten.server.domain.board.dto.PostBoardRequest;
import beside.poten.server.domain.board.dto.PostBoardResponse;
import beside.poten.server.domain.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/board")
public class BoardController {

    private final BoardService boardService;

    @PostMapping("/post")
    public ResponseEntity<PostBoardResponse> postBoard(@RequestBody PostBoardRequest request) {
        return ResponseEntity.ok(boardService.postBoard(request));
    }

    @GetMapping("/search/{id}")
    public ResponseEntity<PostBoardResponse> findBoard(@PathVariable("id") Long id) throws BadRequestException {
        return ResponseEntity.ok(boardService.findBoard(id));
    }

    @PatchMapping("/modify/{id}")
    public ResponseEntity<PostBoardResponse> modifyBoard(
            @RequestBody PostBoardRequest request,
            @PathVariable("id") Long id) throws BadRequestException {
        return ResponseEntity.ok(boardService.modifyBoard(request, id));
    }

    @PatchMapping("/delete/{id}")
    public ResponseEntity<String> deleteBoard(@PathVariable("id") Long id) throws BadRequestException {
        return ResponseEntity.ok(boardService.deleteBoard(id));
    }
}
