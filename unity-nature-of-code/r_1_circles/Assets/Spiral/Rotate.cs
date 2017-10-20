namespace Exercise
{
    using System.Collections;
    using System.Collections.Generic;
    using UnityEngine;

    public class Rotate : MonoBehaviour
    {
        public enum RotateDirection
        {
            Clockwise,
            CounterClockwise
        }

        public RotateDirection direction = RotateDirection.Clockwise;

        private int _directionValue;

        void Awake()
        {
            switch (direction)
            {
                case RotateDirection.Clockwise:
                    _directionValue = -90;
                    break;
                case RotateDirection.CounterClockwise:
                    _directionValue = 90;
                    break;
            }
        }

        void Update()
        {
            transform.Rotate(Vector3.forward * _directionValue * Time.deltaTime);
        }
    }
}
