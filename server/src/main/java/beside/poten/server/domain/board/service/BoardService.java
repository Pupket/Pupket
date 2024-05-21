package beside.poten.server.domain.board.service;

import beside.poten.server.domain.board.constant.BoardDeleted;
import beside.poten.server.domain.board.dto.PostBoardRequest;
import beside.poten.server.domain.board.dto.PostBoardResponse;
import beside.poten.server.domain.board.entity.Board;
import beside.poten.server.domain.board.repository.BoardRepository;
import beside.poten.server.global.superClass.entity.AbstractTimeStamp;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BoardService extends AbstractTimeStamp {

    private final BoardRepository boardRepository;
    private final ModelMapper modelMapper;

    public PostBoardResponse postBoard(PostBoardRequest data) {
        Board board = modelMapper.map(data, Board.class);
        board.setCreatedDate(LocalDateTime.now());
        board.setModifiedDate(null);

        boardRepository.save(board);

        return modelMapper.map(board, PostBoardResponse.class);
    }

    public PostBoardResponse findBoard(Long id) throws BadRequestException {
        Optional<Board> board = boardRepository.findByBoardId(id);
        Board boardEntity = board.orElseThrow(() -> new BadRequestException("Board not found"));

        return modelMapper.map(boardEntity, PostBoardResponse.class);
    }


    public PostBoardResponse modifyBoard(PostBoardRequest data, Long id) throws BadRequestException {
        Board board = boardRepository.findById(id)
                .orElseThrow(() -> new BadRequestException("Board not found with id: " + id));
        board.setModifiedDate(LocalDateTime.now());

        return modelMapper.map(boardRepository.save(board), PostBoardResponse.class);
    }

    public String deleteBoard(Long id) throws BadRequestException {
        Board board = boardRepository.findById(id)
                .orElseThrow(() -> new BadRequestException("Board not found with id: " + id));
        board.setDeleted(BoardDeleted.Y);
        boardRepository.save(board);

        return "deleted successfully";
    }
}
