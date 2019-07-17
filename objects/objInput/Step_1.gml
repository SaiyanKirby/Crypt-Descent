global.pressedUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
global.pressedLeft = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
global.pressedDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
global.pressedRight = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
global.pressedA = keyboard_check_pressed(vk_space);
global.pressedB = keyboard_check_pressed(vk_escape);

global.heldUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
global.heldLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
global.heldDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
global.heldRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
global.pressedA = keyboard_check(vk_space);
global.pressedB = keyboard_check(vk_escape);

global.releasedUp = keyboard_check_released(ord("W")) || keyboard_check_released(vk_up);
global.releasedLeft = keyboard_check_released(ord("A")) || keyboard_check_released(vk_left);
global.releasedDown = keyboard_check_released(ord("S")) || keyboard_check_released(vk_down);
global.releasedRight = keyboard_check_released(ord("D")) || keyboard_check_released(vk_right);
global.pressedA = keyboard_check_released(vk_space);
global.pressedB = keyboard_check_released(vk_escape);