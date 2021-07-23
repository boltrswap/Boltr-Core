pragma solidity =0.5.16;

/*
 * www.boltrswap.com 
 * App:             https://www.boltrswap.com
 * Medium:          https://medium.com/@boltrswap
 * Twitter:         https://twitter.com/boltrswap 
 * Telegram:        https://t.me/boltrswap
 * Announcements:   https://t.me/boltrswap_news
 * GitHub:          https://github.com/boltrswap
 */

import './interfaces/IBoltrFactory.sol';
import './BoltrPair.sol';

contract BoltrFactory is IBoltrFactory {
    bytes32 public constant INIT_CODE_PAIR_HASH = keccak256(abi.encodePacked(type(BoltrPair).creationCode));

    address public feeTo;
    address public feeToSetter;

    mapping(address => mapping(address => address)) public getPair;
    address[] public allPairs;

    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    constructor(address _feeToSetter) public {
        feeToSetter = _feeToSetter;
    }

    function allPairsLength() external view returns (uint) {
        return allPairs.length;
    }

    function createPair(address tokenA, address tokenB) external returns (address pair) {
        require(tokenA != tokenB, 'BoltrSwap: IDENTICAL_ADDRESSES');
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'BoltrSwap: ZERO_ADDRESS');
        require(getPair[token0][token1] == address(0), 'BoltrSwap: PAIR_EXISTS'); // single check is sufficient
        bytes memory bytecode = type(BoltrPair).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        IBoltrPair(pair).initialize(token0, token1);
        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair; // populate mapping in the reverse direction
        allPairs.push(pair);
        emit PairCreated(token0, token1, pair, allPairs.length);
    }

    function setFeeTo(address _feeTo) external {
        require(msg.sender == feeToSetter, 'BoltrSwap: FORBIDDEN');
        feeTo = _feeTo;
    }

    function setFeeToSetter(address _feeToSetter) external {
        require(msg.sender == feeToSetter, 'BoltrSwap: FORBIDDEN');
        feeToSetter = _feeToSetter;
    }
}
