namespace Exercise
{
    using System.Collections;
    using System.Collections.Generic;
    using UnityEngine;

    [RequireComponent(typeof(LineRenderer))]
    public class Oscillator : MonoBehaviour
    {
        public float amplitude = 2;
        public float wavelength = 1;
        public float frequency = 0.2f;

        private LineRenderer _lineRenderer;

        public int _lines = 8;
        private float _frequency;
        private float _x;
        private int _lineIndex;
        private Vector3[] verts;

        private void Awake()
        {
            _lineRenderer = GetComponent<LineRenderer>();

            Initialize();
        }

        private void Update()
        {
            verts = new Vector3[_lines];

            for (_lineIndex = 0; _lineIndex < verts.Length; _lineIndex++)
            {
                _x = (_x + 1) % verts.Length;
                _frequency = (_frequency + (frequency * Time.deltaTime)) % (Mathf.PI * 2);

                float y = amplitude * Mathf.Sin(_x + _frequency);

                verts[_lineIndex] = new Vector3(_x, y, 0.0f);
            }

            _lineRenderer.positionCount = _lines;
            _lineRenderer.SetPositions(verts);
        }

        private void Initialize()
        {
            _lines = Mathf.Clamp(_lines, 0, 9999);

            _x = -1;
            _frequency = frequency;
        }

        private void OnValidate()
        {
            Initialize();
         }
    }

}
