import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  httpOptions;
  constructor(private http:HttpClient) { 
    
    }
  

  addProduct(obj):Observable<object>{
   
     return this.http.post("http://13.88.1.52:4500/products/add",obj);
  }


  
  updateProduct(obj):Observable<object>{
   
    return this.http.post("http://13.88.1.52:4500/products/update",obj);
 }


  removeProduct(obj):Observable<object>{
    this.httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
        })
      }
    return this.http.delete("http://13.88.1.52:4500/products/remove/"+obj,this.httpOptions);
 }

  public getProducts():Observable<object>{
    return this.http.get("http://13.88.1.52:4500/products/all");
  }

  public getProducts2(pattern:string):Observable<object>{
    return this.http.get("http://13.88.1.52:4500/products/all/"+pattern);
  }


}
