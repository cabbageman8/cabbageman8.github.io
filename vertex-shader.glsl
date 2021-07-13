  attribute vec2 aVertexPosition;

  uniform vec2 uScalingFactor;
  uniform vec2 uRotationVector;
  uniform vec2 resolution;

  void main() {
    vec2 rotatedPosition = vec2((aVertexPosition.x),
      (aVertexPosition.y)
    );

    gl_Position = vec4(rotatedPosition * uScalingFactor, 0.0, 1.0);
  }
