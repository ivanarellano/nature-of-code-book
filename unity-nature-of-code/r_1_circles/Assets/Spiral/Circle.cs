namespace Exercise
{
    using UnityEngine;

    [RequireComponent(typeof(LineRenderer))]
    public class Circle : MonoBehaviour
    {
        [SerializeField] private float _radius = 3.0f;
        [SerializeField] private float _startAngle = 0.0f;
        [SerializeField] private float _endAngle = 360.0f;
        [SerializeField] private int _circleVertices = 12;
        [SerializeField] private bool _spiral;

        private LineRenderer _lineRenderer;

        private void Awake()
        {
            _lineRenderer = GetComponent<LineRenderer>();
        }

        private void Start()
        {
            CreateCircle();
        }

        private void CreateCircle()
        {
            Vector3[] vertices = new Vector3[_circleVertices];

            float radius = _spiral ? 0.0f : _radius;
            float theta = Mathf.Deg2Rad * _startAngle;
            float arcLengthStride = (_endAngle - _startAngle) / _circleVertices;

            for (int i = 0; i < vertices.Length; i++)
            {
                float x = radius * Mathf.Cos(theta);
                float y = radius * Mathf.Sin(theta);

                vertices[i] = new Vector3(x, y, 0.0f);

                theta += Mathf.Deg2Rad * arcLengthStride;

                if (_spiral)
                {
                    radius += _radius / _circleVertices;
                }
            }

            _lineRenderer.positionCount = _circleVertices;
            _lineRenderer.SetPositions(vertices);
        }

        private void OnValidate()
        {
            _circleVertices = Mathf.Clamp(_circleVertices, 0, 9999);
        }
    }
}
