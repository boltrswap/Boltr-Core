pragma solidity >=0.5.0;

/*
 * www.boltrswap.com 
 * App:             https://www.boltrswap.com
 * Medium:          https://medium.com/@boltrswap
 * Twitter:         https://twitter.com/boltrswap 
 * Telegram:        https://t.me/boltrswap
 * Announcements:   https://t.me/boltrswap_news
 * GitHub:          https://github.com/boltrswap
 */
 
interface IBoltrFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}
