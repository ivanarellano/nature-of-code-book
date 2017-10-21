using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorGrid2 : MonoBehaviour
{
    public enum ColorPattern
    {
        GrayscaleVertical,
        GrayscaleHorizontal,
        Random,
        Checkerboard,
        VerticalStripe,
        HorizontalStripe
    }

    [SerializeField] private GameObject _prefab;
    [SerializeField] private Transform _origin;
    [SerializeField] private int _columns;
    [SerializeField] private int _rows;
    [SerializeField] private float _innerMargin;
    [SerializeField] private ColorPattern _colorPattern;

    private float _inverseColumnLength;
    private float _inverseRowLength;

    private void Update()
    {
        Initialize();
    }

    private void OnValidate()
    {
        _columns = Mathf.Clamp(_columns, 0, 9999);
        _rows = Mathf.Clamp(_rows, 0, 9999);
    }

    private void Initialize()
    {
        /// TODO: Pool objects
        for (int i = 0; i < _origin.childCount; i++)
        {
            Destroy(_origin.GetChild(i).gameObject);
        }

        _inverseColumnLength = 1.0f / (_columns - 1);
        _inverseRowLength = 1.0f / (_rows - 1);

        for (int x = 0; x < _columns; x++)
        {
            for (int z = 0; z < _rows; z++)
            {
                GameObject obj = Instantiate(_prefab, _origin, false);

                Vector3 position = new Vector3(x, 0, z);
                if (x > 0)
                {
                    position.x += _innerMargin * x;
                }

                if (z > 0)
                {
                    position.z += _innerMargin * z;
                }

                obj.transform.position += obj.transform.TransformDirection(position);

                switch (_colorPattern)
                {
                    case ColorPattern.GrayscaleVertical:
                        GrayscaleVerticalColor(obj, z);
                        break;
                    case ColorPattern.GrayscaleHorizontal:
                        GrayscaleHorizontalColor(obj, x);
                        break;
                    case ColorPattern.Random:
                        RandomColor(obj);
                        break;
                    case ColorPattern.VerticalStripe:
                        StripeColor(obj, x);
                        break;
                    case ColorPattern.HorizontalStripe:
                        StripeColor(obj, z);
                        break;
                    case ColorPattern.Checkerboard:
                        CheckerboardColor(obj, x, z);
                        break;
                }
            }
        }
    }

    private void GrayscaleVerticalColor(GameObject obj, int rowLoc)
    {
        float colorVal = _inverseRowLength * rowLoc;
        TintPrefab(obj, new Color(colorVal, colorVal, colorVal));
    }

    private void GrayscaleHorizontalColor(GameObject obj, int columnLoc)
    {
        float colorVal = _inverseColumnLength * columnLoc;
        TintPrefab(obj, new Color(colorVal, colorVal, colorVal));
    }

    private void RandomColor(GameObject obj)
    {
        TintPrefab(obj, new Color(Random.Range(0, 1.0f), Random.Range(0, 1.0f), Random.Range(0, 1.0f)));
    }

    private void StripeColor(GameObject obj, int loc)
    {
        TintPrefab(obj, loc % 2 == 0 ? Color.black : Color.white);
    }

    private void CheckerboardColor(GameObject obj, int columnLoc, int rowLoc)
    {
        if (columnLoc % 2 == 0)
        {
            StripeColor(obj, rowLoc);
        }
        else
        {
            StripeColor(obj, rowLoc + 1);
        }
    }

    private void TintPrefab(GameObject obj, Color color)
    {
        foreach (Material mat in obj.GetComponent<Renderer>().materials)
        {
            mat.color = color;
        }
    }
}
