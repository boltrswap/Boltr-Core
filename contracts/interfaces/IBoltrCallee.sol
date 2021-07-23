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

interface IBoltrCallee {
    function pancakeCall(address sender, uint amount0, uint amount1, bytes calldata data) external;
}
