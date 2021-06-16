package aaa;

import java.util.Arrays;

public class Goods implements Comparable{
    private String name;
    private double price;

    public Goods() {
    }

    public Goods(String name, double price) {
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }


    public static void main(String[] args) {
        Goods[] arr = new Goods[5];
        arr[0] = new Goods("leno", 343);
        arr[1] = new Goods("vivo", 12);
        arr[2] = new Goods("open", 31);
        arr[3] = new Goods("huawei", 24);
        arr[4] = new Goods("xiaomi", 24);

        Arrays.sort(arr);
        System.out.println(Arrays.toString(arr));
    }

    // 排序方式
    @Override
    public int compareTo(Object o) {
        if (o instanceof Goods) { // 判断传入的是否是 商品类对象
            Goods goods = (Goods)o;
            // 从小到大
            if (this.price > goods.price) {
                return 1;
            } else if (this.price < goods.price) {
                return -1;
            } else {
                return -this.name.compareTo(((Goods) o).name);// 价格相同，按照名称字母顺序从小到大排序。
            }
            // 从大到小
//            if (this.price > goods.price) {
//                return -1;
//            } else if (this.price < goods.price) {
//                return 1;
//            } else {
//                return this.name.compareTo(((Goods) o).name);// 价格相同，按照名称字母顺序从小到大排序。
//            }


            // 方式二
            //return Double.compare(this.price, goods.price);
        } else { // 不是商品类对象，抛出一个异常
            throw new RuntimeException("传入的数据不一致");
        }
    }
}

