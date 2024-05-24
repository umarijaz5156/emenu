<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AllergenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */


private $arr = [
        ['post_type'=>'allergen',   'title'=>"Peanut",           'image'=>'8a32ee07-9f27-4da0-97ae-38e2a4e9749f'],
        ['post_type'=>'allergen',   'title'=>"Egg",           'image'=>'e703e8fb-2c1a-4d78-b6cc-5f64963cf8b0'],
        ['post_type'=>'allergen',   'title'=>"Yogurt",           'image'=>'5aaa432a-6594-4e79-987f-aa861d407989'],
        ['post_type'=>'allergen',   'title'=>"Cornflakes",           'image'=>'8c1a9e9f-a3c7-496c-97a5-a6e2d9f2463f'],
        ['post_type'=>'allergen',   'title'=>"Wheat",           'image'=>'3e5faf12-f463-478f-9902-467f6e651fa4'],
        ['post_type'=>'allergen',   'title'=>"Corn",           'image'=>'90ad0225-d1f4-495d-a2ba-b28b804f4367'],
        ['post_type'=>'allergen',   'title'=>"Oat",           'image'=>'02552f66-5a00-462b-a554-c1ca4f3d9421'],
        ['post_type'=>'allergen',   'title'=>"Wheat flour",           'image'=>'98ebf74c-7077-44ab-b8d8-45f40ea38f5f'],
        ['post_type'=>'allergen',   'title'=>"Rice",           'image'=>'b438f0ee-54ac-4453-9ae8-0a7aefed6572'],
        ['post_type'=>'allergen',   'title'=>"Bread",           'image'=>'f190213d-6d0b-46e7-b229-a62166240547'],
        ['post_type'=>'allergen',   'title'=>"Almond",           'image'=>'be1e876d-0633-4c32-a3e8-611997719ce8'],
        ['post_type'=>'allergen',   'title'=>"Croissant",           'image'=>'ec4b5385-a523-4fb8-b21d-fa52df06707c'],
        ['post_type'=>'allergen',   'title'=>"Lobster",           'image'=>'8dccc5e7-3f72-4723-a351-a6b34879486c'],
        ['post_type'=>'allergen',   'title'=>"Crab",           'image'=>'fcb67cfd-f7ea-4482-80e5-1fe8c732a211'],
        ['post_type'=>'allergen',   'title'=>"Shrimp",           'image'=>'75e148e8-1455-4947-8e9c-ba722804f786'],
        ['post_type'=>'allergen',   'title'=>"Squid",           'image'=>'d9487639-3e60-4e33-82eb-56f1feade9cb'],
        ['post_type'=>'allergen',   'title'=>"Mussel",           'image'=>'1bb49741-6337-433a-84fb-66c209713768'],
        ['post_type'=>'allergen',   'title'=>"Salmon",           'image'=>'7105a42d-3cd3-495e-aaff-dff95071436b'],
        ['post_type'=>'allergen',   'title'=>"Shell",           'image'=>'96f02649-20f8-4c8c-bdd6-5b42617d5280'],
        ['post_type'=>'allergen',   'title'=>"Chicken",           'image'=>'a08f2b49-a6e8-4ed6-a80e-65f08f61573b'],
        ['post_type'=>'allergen',   'title'=>"Soy",           'image'=>'6a697b0a-ca96-4013-a6e8-5f0c3e06d856'],
        ['post_type'=>'allergen',   'title'=>"Meat",           'image'=>'8f021a40-9882-4c43-9a3e-84e1227bc78b'],
        ['post_type'=>'allergen',   'title'=>"Mushroom",           'image'=>'1d86f5e9-9130-4d28-b0ba-448333a9cab6'],
        ['post_type'=>'allergen',   'title'=>"Honey",           'image'=>'3c8cb4b5-cd00-453d-8ded-3ff1da99dc46'],
        ['post_type'=>'allergen',   'title'=>"Wine",           'image'=>'51fd83bf-8547-43b3-8b54-0d821b7906dd'],
        ['post_type'=>'allergen',   'title'=>"Beer",           'image'=>'a87a71de-7f1f-4de3-a8f0-9a10abdfdb40'],
        ['post_type'=>'allergen',   'title'=>"Tuna",           'image'=>'13959618-2c20-4ec8-b20e-13e190019ae1'],
        ['post_type'=>'allergen',   'title'=>"Juice Box",           'image'=>'a3bee82c-f99d-4fcf-bfce-edabe56327f9'],
        ['post_type'=>'allergen',   'title'=>"Mustard",           'image'=>'d6a0fdba-86f1-44b5-a81c-ad3d3376b4ee'],
        ['post_type'=>'allergen',   'title'=>"Beans",           'image'=>'f7c79fc5-f9b8-4837-9b21-36c90d31cff2'],
        ['post_type'=>'allergen',   'title'=>"Soy Sauce",           'image'=>'8e0d073e-341e-4877-8606-cf249cbdd61e'],
        ['post_type'=>'allergen',   'title'=>"Blueberry",           'image'=>'c38a0571-58c2-4b41-a2f8-c78548178c59'],
        ['post_type'=>'allergen',   'title'=>"Peach",           'image'=>'9db69ba5-d45a-417b-aeab-10189310334a'],
        ['post_type'=>'allergen',   'title'=>"Melon",           'image'=>'5bcc81ad-31ba-4d56-afe1-2b276d50f72f'],
        ['post_type'=>'allergen',   'title'=>"Lemon",           'image'=>'62c1cfba-4ba4-4d1a-aa0b-82ce9cb8a7e3'],
        ['post_type'=>'allergen',   'title'=>"Celery",           'image'=>'225fe253-fa41-413f-b537-c9ef9c61b085'],
        ['post_type'=>'allergen',   'title'=>"Avocado",           'image'=>'c0f90621-b9b8-4091-b6d9-161a8f5bd12f'],
        ['post_type'=>'allergen',   'title'=>"Chocolate",           'image'=>'9142b532-2c2f-43fd-b284-ddc95bdb9113'],
        ['post_type'=>'allergen',   'title'=>"Cookie",           'image'=>'8dfa4165-b4f2-467c-b6a3-e119eca6f3f5'],
        ['post_type'=>'allergen',   'title'=>"Butter",           'image'=>'27119527-7206-4b79-8b56-03f1b2ac3d4b'],
        ['post_type'=>'allergen',   'title'=>"Lupin",           'image'=>'8acfe81e-4178-467b-a191-2bd9c67514ed'],
        ['post_type'=>'allergen',   'title'=>"Peanut Butter",           'image'=>'7096d274-8b7f-47b9-8cc5-0bfda8b5470f'],
        ['post_type'=>'allergen',   'title'=>"Sesame",           'image'=>'b843e4d5-2398-45e7-b5b0-30b83eb865bb'],
        ['post_type'=>'allergen',   'title'=>"Milk",           'image'=>'b638110e-24e2-4a11-8a36-359006d6086a'],
        ['post_type'=>'allergen',   'title'=>"Cheese",           'image'=>'c184f357-efb2-4a24-a915-9905bd410f3e'],
        ['post_type'=>'allergen',   'title'=>"Donut",           'image'=>'f87b60ab-2214-4585-82d1-9792247dcc71'],
        ['post_type'=>'allergen',   'title'=>"Fish",           'image'=>'c89a60d0-88da-495c-abd9-9d09f476e1b1'],
        ['post_type'=>'allergen',   'title'=>"Sugar",           'image'=>'ff13dcdb-7ee8-4240-8c91-c51c5edf918d'],
        ['post_type'=>'allergen',   'title'=>"Sulphite",           'image'=>'34704bf7-78a9-4a05-be1f-ae94b961e9fa'],
        ['post_type'=>'allergen',   'title'=>"Coffee beans",           'image'=>'178ee1fa-6dbe-4641-aa9d-574c23857d77'],
    ];
    public function run()
    {
        foreach ($this->arr as $value) {
            DB::table('posts')->insert([
                'post_type'   => $value['post_type'],
                'title'       => $value['title'],
                'description' => "" ,
                'image'       => $value['image'] ,
                'created_at'  => now(),
                'updated_at'  => now(),
            ]);
        }
    }
}
