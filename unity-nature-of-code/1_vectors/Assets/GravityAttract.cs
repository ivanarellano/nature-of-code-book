using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshFilter))]
public class GravityAttract : MonoBehaviour {

    private List<Mesh> meshes;

    public int objectCount = 6;

	void Start () {
        Mesh mesh = GetComponent<MeshFilter>().mesh;

        meshes = new List<Mesh>(objectCount);
	}
	
	void Update () {
		
	}
}
