// Calculate movement 
vx = ((moveRight - moveLeft) * walkSpeed); 
vy = ((moveDown - moveUp) * walkSpeed);
// If Idle 
if (vx == 0 && vy == 0) { 
// do nothing for now 
} 
// If moving 
if (vx != 0 || vy != 0) { 
	x += vx;
	y += vy;
}
