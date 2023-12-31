GDPC                p                                                                      %   T   res://.godot/exported/133200997/export-6dd23c115fe37d07d4eed2f5dd25d7d0-bullet.scn         "      ��ʉ�N-���lk�C    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res �S      �	      1?y��/ͳ�p=�!    P   res://.godot/exported/133200997/export-7eea91d733d6cc73c5409a803f945015-jet.scn �      2      ����N�����7�Β    T   res://.godot/exported/133200997/export-b14855f508c3dd2de5972f58a38bd544-particle.scn`      s      �2>��Ɏ���f�ܦ    T   res://.godot/exported/133200997/export-b3a26ca6175bec0d7ef99f5fbb96b6d9-enemy_1.scn       �      �dN��y,��7��i    T   res://.godot/exported/133200997/export-de71c21559ba3535c3f0645ed0c93644-World.scn   �H            V{��c���D��)�V    ,   res://.godot/global_script_class_cache.cfg  �i             ��Р�8���8~$}P�    D   res://.godot/imported/BG1.png-53d04e24e4cb9812afb8521edeccc0f3.ctex P-      �      �{�f!���-�O��    H   res://.godot/imported/Icon1.png-7c819a085334e25f039c9fb41b275af9.ctex   �      �       ��vݟ�8▍�L��H�    H   res://.godot/imported/Icon2.png-a195ddf4e239c005c9a3a70da162edce.ctex   p      �       �p�V�s�Ԗ,Ef;�    T   res://.godot/imported/Player_Ship_Sprite.png-6191e22d6722e03e98875c1bf6950e7a.ctex  P(      r      $�m:�ec':ĳ�c�4    P   res://.godot/imported/enemy_sprites.png-8f8faa83c0db9dbe49550e3789a0100d.ctex   �            �b0�oz���8|S��       res://.godot/uid_cache.bin  �i      �      ���ֶ��e��Nc       res://Enemies/Icon1.ico �b      ~      ���x����4Ҭ��0�?       res://Enemies/Icon2.ico  ^      ~      ���(p�E0V�!�O       res://Enemies/enemy1.gd               ~�̉����
��d        res://Enemies/enemy_1.tscn.remap g      d       �P�S5q Kqr_�    (   res://Enemies/enemy_sprites.png.import         �       7� ��ڒ2��{|S�S       res://Enemies/particle.gd   �      �      ��ˬ�0~��s
1t    $   res://Enemies/particle.tscn.remap   �g      e       ���d,f�d/*';����       res://Icon/Icon1.png.import �      �       �ڗ�6J���C��u��       res://Icon/Icon2.png.import 0      �       T�NrG{C���EB��>       res://Player/Player.gd  0      	      �pQ��쳠@n'	尳    ,   res://Player/Player_Ship_Sprite.png.import  �)      �       ��g����6���        res://Player/bullet.tscn.remap   h      c       �r��2V�2T5��Z2       res://Player/jet.gd 0      �      ��J��%G��L��1�       res://Player/jet.tscn.remap ph      `       ������R�s�       res://Player/shoot.gd   �*      �      ��`��ݕA�{���c       res://World/BG1.png.import  P<      �       ��cs��0fPY�I>�5       res://World/Lives.gd@A      3      �z��Uz�w}�Ī�#�       res://World/World.tscn.remap�h      b       ;��,������n�[l       res://World/enemy_spawn.gd  =      �      >�TV�(0�ut��wǃ       res://World/last_score.gd   @      '      �T�.�k�5�%!8�       res://World/score.gd�G            �����<v��_���       res://default_env.tres.remap@i      h       cXv�S��P�O�Tq�o       res://global.gd p]      �       &"c���xb%t       res://project.binarypk      �      ��W 5$�L_�:�6�#�    extends CharacterBody2D

const speed = 20
const max_speed = 40
var random_rotate = randf_range(-0.5, 0.5)
@onready var earth = get_node("../Earth")
const particle = preload("res://Enemies/particle.tscn")

func _physics_process(delta):
	rotate(random_rotate)
	velocity += (earth.position-position).normalized() * speed * delta
	velocity = velocity.limit_length(max_speed)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if (body.is_in_group("Bullet")):
		Global.score += 1
		var particle1 = particle.instantiate()
		var particle2 = particle.instantiate()
		var particle3 = particle.instantiate()
		get_parent().add_child(particle1)
		get_parent().add_child(particle2)
		get_parent().add_child(particle3)
		particle1.position = position
		particle2.position = position
		particle3.position = position
		self.queue_free()

	if (body.is_in_group("Earth")):
		for i in 3:
			var particle1 = particle.instantiate()
			get_parent().add_child(particle1)
			particle1.position = position
		Global.lives -= 1
		self.queue_free()
��t��;H�{�-RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    height    script 	   _bundled       Script    res://Enemies/enemy1.gd ��������
   Texture2D     res://Enemies/enemy_sprites.png �^�L�K      local://CapsuleShape2D_p0sa5 �         local://PackedScene_44frp �         CapsuleShape2D            @@        `A         PackedScene          	         names "         Enemy1    script    CharacterBody2D    Area2D    CollisionShape2D    scale    shape 	   Sprite2D    texture    vframes    frame    _on_area_2d_body_entered    body_entered    	   variants                 
   ���?���?                      
               node_count             nodes     1   ��������       ����                            ����                     ����                                 ����         	      
                        ����                   conn_count             conns                                      node_paths              editable_instances              version             RSRCVߵ8�6gA�³�GST2      �      ����                �        �  RIFF�  WEBPVP8L�  /�'��$ �6�5�W�}%j�I�8�����;?���Ȇ �m$I��k������?Z   � 
����UJ����?B$ܳ�7
��U
TE�o �/�V�*�$�mۆ��N:��W� �y��?�m���gD/(Q[��ȭ��Ƞ�G*�C�)Ǒ%j�[��c�p%��j�&'ә�<�9Ιr��L��(B�7�xK߸y� [����^��i]�d�ИS�����U"0!�^�dG#�AFs�~���}1'}"5�o����y���㬁L��`��������	|��t�]���3w���	�sԣ-�H�5��z�\�,T�O{��
�sԣ-m�<�Z���a??��������hKۀ� ���#�z�u�Z:s�n�x=��=ih�߿�)"+�R%��I�\R�����[�m�I��I�ʶ�[�nwpF��%U�\������)��H���<��p[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d3xhbjmgnykhj"
path="res://.godot/imported/enemy_sprites.png-8f8faa83c0db9dbe49550e3789a0100d.ctex"
metadata={
"vram_texture": false
}
 ʎر�extends Sprite2D

var time = 0
var speed = randf_range(15, 25)
var r = randf_range(1, -1)
@onready var earth = get_node("../Earth")
@onready var direction = (earth.position-position).normalized() + Vector2(randf_range(-3, 3), randf_range(-3, 3))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position -= direction * speed * delta
	time += delta 
	rotate(r * delta)
	modulate.a -= randf_range(0, 1) * delta
	modulate.r -= randf_range(0, 1) * delta
	modulate.g -= randf_range(0, 1) * delta
	modulate.b -= randf_range(0, 1) * delta
	if (time > 4):
		time = 0
		self.queue_free()
	pass
 
c�w|��sg�0RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script    
   Texture2D $   res://Player/Player_Ship_Sprite.png �*܀mA   Script    res://Enemies/particle.gd ��������      local://PackedScene_1pbpy O         PackedScene          	         names "   	   	   particle 	   modulate 	   position    texture    hframes    vframes    frame    script 	   Sprite2D    	   variants            �?��4?  �?  �?
     ��                                               node_count             nodes        ��������       ����                                                        conn_count              conns               node_paths              editable_instances              version             RSRCB�Ϋ�����,�;GST2            ����                        �   RIFFz   WEBPVP8Lm   /�/@�m3�q�� � ȶ�?�,&q�d��d�c���? ����t� �U)�F��	l����e��� {J\e\pp!��R�%	���H�UM1UKUG_ϳwta� ��B���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://daiy7p4rmwbpq"
path="res://.godot/imported/Icon1.png-7c819a085334e25f039c9fb41b275af9.ctex"
metadata={
"vram_texture": false
}
 Z�creA��Җ�GST2            ����                        �   RIFFx   WEBPVP8Ll   /�'  YU(L ��&Y @�,8Qd� {�	�6��2؏�u\�`��O��� �l�@;U���H��͑$6�RؒHzH[l�r���	qg;���کZ�z'~�|���%[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://qjdgdwqgb6qn"
path="res://.godot/imported/Icon2.png-a195ddf4e239c005c9a3a70da162edce.ctex"
metadata={
"vram_texture": false
}
 #k�Mޕ�oC4
A�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Player/shoot.gd ��������
   Texture2D $   res://Player/Player_Ship_Sprite.png �*܀mA      local://RectangleShape2D_wqc4v �         local://PackedScene_mjx3e �         RectangleShape2D       
     �@  �@         PackedScene          	         names "   
      CharacterBody2D    script    Bullet 	   Sprite2D    texture    hframes    vframes    frame    CollisionShape2D    shape    	   variants                                                            node_count             nodes     "   ��������        ����                              ����                                             ����   	                conn_count              conns               node_paths              editable_instances              version             RSRC��L�@x��wc��?extends Sprite2D

var timer = 0
var speed = randf_range(20, 30)
var r1 = randf_range(-1, 1)
var r2 = randf_range(0.5, 1.5)
var r3 = randf_range(0, 1)
var r4 = randf_range(0, 1)
var r5 = randf_range(0, 1)
@onready var player = get_node("../Player")
@onready var direction = player.velocity.normalized() + Vector2(randf_range(-1, 1), randf_range(-1, 1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotate(r1 * delta)
	position -= direction * speed * delta
	
	modulate.a -= r2 * delta
	modulate.r -= 0.4 * delta
	modulate.g -= 0.2 * delta
	modulate.b -= 0.7 * delta
	
	timer += delta
	if (timer > 5):
		timer = 0
		self.queue_free()
���E��ңRSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script    
   Texture2D $   res://Player/Player_Ship_Sprite.png �*܀mA   Script    res://Player/jet.gd ��������      local://PackedScene_rvoq4 I         PackedScene          	         names "         jet    z_index    texture    hframes    vframes    frame    script 	   Sprite2D    	   variants          ����                                     node_count             nodes        ��������       ����                                                  conn_count              conns               node_paths              editable_instances              version             RSRC���U�?�^���extends CharacterBody2D

const bulletPreload = preload('res://Player/bullet.tscn')
const jetPreload = preload('res://Player/jet.tscn')

const max_speed = 80
const accel = 150
const friction = 75
const rotation_speed = 0.08
#const rotation_speed = 0.2

#var velocity = Vector2.ZERO
var input = Vector2.ZERO
var time = 0

func _ready():
	$Sprite2D.modulate.a = 255
	get_node('../Earth/Sprite2D').modulate.a = 255

func movement(delta):
	input.x = int(Input.is_action_pressed("ui_right"))
	input.x -= int(Input.is_action_pressed("ui_left"))
	
	input.y = int(Input.is_action_pressed("ui_down"))
	input.y -= int(Input.is_action_pressed("ui_up"))
	
	input = input.normalized()
	if (input.length() == 0):
		if (velocity.length() > (friction * delta)):
			velocity -= velocity.normalized() * friction * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)

func rotating(delta):
	var angle = -transform.y.angle_to(input)
	#if (Input.is_action_pressed("ui_down")):
	#	rotation += 3 * delta
	rotate(sign(angle) * min(delta * rotation_speed * velocity.length(), abs(angle) * velocity.length()))
	
	#if (int(delta) % 100 == 0):
	#	print(input)

func teleport():
	if (position.x < -5):
		position.x = 325
	if (position.x > 325):
		position.x = -5

	if (position.y < -5):
		position.y = 186
	if (position.y > 186):
		position.y = -5

func shooting():
	var bullet = bulletPreload.instantiate()
	get_parent().add_child(bullet) 
	bullet.position = position
	#bullet.position += 12 * Vector2(sin(rotation_degrees/180 * 3.14), -cos(rotation_degrees/180 * 3.14))
	bullet.position += 12 * Vector2(sin(rotation), -cos(rotation))
	
	velocity -= 12 * Vector2(sin(rotation), -cos(rotation))

func shoot_jet():
	var jet = jetPreload.instantiate()
	get_parent().add_child(jet)
	jet.position = position - (velocity.normalized() * 5 )

func _physics_process(delta):
	if (Global.alive):
		rotating(delta)
		movement(delta)
		teleport()
		time += delta * 4
		if (Input.is_action_just_pressed("ui_accept") or (Input.is_action_pressed("ui_accept") && time > 0.8)):
			shooting()
			time = 0
		if (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
			shoot_jet()
		velocity = velocity.limit_length(max_speed)
		move_and_slide()


'v���GST2       @      ����                 @        :  RIFF2  WEBPVP8L%  /���&����{��CD�d`CQ$)�X X�F��:Qm$+�����)�GmDA��� ��;U@�˱���2wo�D�%�:u��d7n��)����� x�D�'@�
o¦c����T�!t���o�ׄ�����*'Y��j��a��l;J��QfF�xR�@H;	��(�������	��d3�糙�mǀ;��h���C��� �ˤ�]dfV��T�`�
fT�t��@&�J����KA�w��Ǹۤ�u��w����l]��X��?�㿎w��\.�ٲ,˱�]� �Wuv��̗:)�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b8fyjgni8k6se"
path="res://.godot/imported/Player_Ship_Sprite.png-6191e22d6722e03e98875c1bf6950e7a.ctex"
metadata={
"vram_texture": false
}
 �extends  CharacterBody2D

const speed = 200
var timer = 0
# Called when the node enters the scene tree for the first time.
@onready var player = get_node("../Player")
#@onready var direction = Vector2(sin(player.rotation_degrees/180 * 3.14), -cos(player.rotation_degrees/180 * 3.14))
@onready var direction = Vector2(sin(player.rotation), -cos(player.rotation))
	

func shoot(delta):
	#var collide = move_and_collide(direction * speed * delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	shoot(delta)
	timer += delta
	if (timer > 3):
		self.queue_free()
	
	velocity = direction * speed
	move_and_slide()
	pass
Ɉ�6��V<GST2      �     ����                �       �  RIFF�  WEBPVP8L�  /�ĳ G� �$Iɚ]T����m$H�����,�Q�H��T�A9���w��:��
�p
�@N��&@�p��B��I?`�<�,!��N A��s�5��;��)V{�=g�cg7��̬;K�&Z7gX�$���n�P̙�Q�I�v�<�j��AkP#�P���D
�=���A,i۴������� ��Q�|�+ՠ@�m�jی���O�Ve��0()3Y)3���e�g�=�"�?��m��ֶ��y�t�ʿ	T ���~�����������8��@A���m՗FHH)-#Rr�.
�Hw��x���b�ID�' 5�e��b\��L+9�uq|��d����\��Oв�M<�ӭ<��'�S�<g��[d�y{�"�;��'�E��� }Hk��d>X�Q���}\=��m�r�q��C�Q�^�丮��i/�!�ϙ��ز��aCQ���<�^Db�nя�=��5���v���ٷ	E�Q$��o����Er򼲾�Ѷ�#/������/�����^Zk�cN��K�y��r�cP�zyO)Fc4�ۣ>��R�jɌO]�{K�*j��SA�%{F�����B֫xF���{vZ��2rի����U�g ��.�3�5kK�q,W�D�X������׳�H��xf��J�7�gLZ���"�3����a�-2��l���xM�_�|vs"T�Cbtr>+&˪X��X�ۓ����g����D����|�Mr�R�̠�tu�"���̰'�tgTV4+S��|FK�?�NZ��ا�J]"�_{��Pxz�\��s,\���2��ע���|Zv\�J��+Rg��(U��\���\��צ�t�\�ڲg.Pe�<���d�RQ��TQ�r���Cת�<r�jՒ=q�*��q����hE�e�[	)?p�
�$�]�._����c�"V���5�%.d��e�8<�O=<��TtY������։��Z%����.l�8.my���ա9.omh�\o\���e�X>U�sI8�����>{�jW���.]�O�\�:P�����^�_�\�PVL�K�����/b���K��.-%H|����s��9�� 睛M�ϑ�
	��lb}N�%lHvg�>��s��9=�P"�	�"�lY0}�cbd���F�k�'3;�[�Gnۙ!��&l��$�k�'2Or��0}s%�5��S�/���0}ڍ)��jb�d��ʴIb����2S'�5&O�ژ>ɫ�0}�c%�}e孕Y��zf嬃�������ɔ��0��UcB��}��I̩<�1�Ҕ���oL����+?	�Oc~%��������K�Y�������D�I�Of��{����閌�a�����9��z���L�$T��g�e���K@�G�����=30�Dlq�>-0�Nb��L�8=b�L�t�Gl��a�x&d��L�DS#�O�>´L2���c�Ocn&��q�>�3�Ԅ��la���,M+	ۧ1Qs�`�T��S���D�}�g6�7��&��W�6Sdf��t :4ј�Sq c	aF�`���ҚW��YJ��y�7����L�R3�O�>��������N�'c�����#�8i��G��)�ۧ2��Eq�O���- �bv0T��`.e���ҡ�5Fk�K;4C�k^�"b50b����Z�a;G�?ۧlav���ә�A0~2�ϊ�ә�i�`�d�fzN��)��&{>H�>�a�<�O	�>����S��Y�8�'3�s@����>=`�Ԁ�ә������?	ۧ߰}:J0��Ϗ?���}�C�t�?X�G@����@A�GhF@A���p;@A�i'������7����@'ځ�1~<��1�:Ə`�d���F�����	����@�)N��1v5>�W<W�GB�|���h��ARP���qEh(���,2��,�Fٕ40�%�?�4*�40�Kt6TeDel�z��)�gC_�R_�}z��i�'�4�h��iۧ�8C��?�gCyƏ���g���'�B�lA�FM��>_��4i���.��Ц�"�'�P#��Q���Q�a��ϊ^��O	����o(���P��q�`C�L������0}����	q(ڀ�ۂ��~w(�h�<�66���Q�q�<J7
Jd�o�)�%f�F�|P��&��l ��~��\�	|o3�vc��$�s���
��m%<��zx*�'4��D��S%���l
y����O[Qʣ�xC-���������yl���Z�|z���GU��!U冢PeEW����c�+�z$���GZ{��=��=~ZrX>ǂ�:]
|ഄ6�3[D���=�|�lm>Vv���r��҇�.h�A"�>B~��ڇG�h��!(���<*~X�w���$����~,t����pw��a�Zt�����+��իǊ��j� |�J�/���׬D��؂��c[�_��W�ש�u�x��0ƚ�(��g�� �:9G�_GWK��a�?GV-iA1��Ǹ:V�󭲟�ͣ�ۣa@UAI7�<0�du��/�.+��+�eLƗ�e���<$b8��]<���%a?��Z|��<k{�X����ǐ<_[rؒ窈Ǟ<OM"6�Ij��ݣò<;G
X�g��{,��"+V�iG�ah���E��sQ����P��y
ږW�����-߰=?�-9�Ϗ�+6��Բ��x�x�)���vd�=�a�|�(����O����5Y=�s�UR�J}:���{Lէ�$c�>����f���"�=��w�[�ˊ����"+V�W$L�o�����h�H�������%�����_�ׯ���$�tX���>����O�������?����O�����
������
���I�+�����7�����_������k�����_������k���8�P���I�;�w-Oz1���ټ���NlK~�鄚��r�/���D����&���ao[͟�5�����&���54k����L��ٞ+�I3{[���[ſl^ֶ�7.�'�U�,�餹�~%���z����M���:[��u�۝�'k���$-�����[ŭ�#�w��jE��(n�	���q�����X�M�a�m��1��*ّ>#��:�ui^|kM��5�2��G�.6)�綷�(��y�s����~wk�C۷�*�w�9X�0{ߟ���Aq���m^ƾ��SE��l�<�Mc��.����j�}ɋ��9C.Ժ4�ޙ��(s��M��z�ɘڶ�Ɛ=e-��dQEK���|�f���̪d�5VĶ�N�kl�&����jr�p�P��`�Z[C.V�m��d�z��Y�^�#C�Թ+����Z��j����N[k��Ҵ���K�P��Ei�T벪ŋ�Ő���?Gf���6��B�������}�CG��xbO����,�Ύ}}��$�N����|D���W��&"�}~�򌅈�cPvƒ�PsRρ�8[] �L��Qm&��5��T�KIN�>{�.fkA^�|��I�[�߄l~$�v_��>��Ұ�#Y�	 |��`y���-���k�e7�kR�-�J�����t�ɻ������J����QV�9LE%jd��#UQ�E�Y4�O�Ѫ&��'�>G��l�g)�}>sԪHr�>�WCF���'d���W>.?5�O2�>����1,�O��> �$��9�%cA�� �x�����O���O��c~C��?�F��~<�ψ�3!�,?I	?I#�8����#�L?��~4E�~�r ��u�����2	[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b0tqrvb0vn3gt"
path="res://.godot/imported/BG1.png-53d04e24e4cb9812afb8521edeccc0f3.ctex"
metadata={
"vram_texture": false
}
 extends Node2D

const enemy1 = preload("res://Enemies/enemy_1.tscn")
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Global.alive):
		timer += delta
		if (timer > randf_range(1, 4)):
			timer = 0
			var enemy = enemy1.instantiate()
			add_child(enemy)
			
			var random = randi_range(1, 4)
			match random:
				1:
					enemy.position = Vector2(randf_range(-10, 330), -10)
				2:
					enemy.position = Vector2(randf_range(-10, 330), 190)
				3:
					enemy.position = Vector2(-10, randf_range(-10, 190))
				4:
					enemy.position = Vector2(330, randf_range(-10, 190))
�w~�extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	text = "Your last score : " + str(Global.score)
	pass
w���ʖ�.�extends Node2D

const particlePre = preload("res://Enemies/particle.tscn")
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.lives = 3
	

func death():
	Global.alive = false
	for i in 3:
		var particle1 = particlePre.instantiate()
		get_parent().add_child(particle1)
		particle1.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle1.position = get_node("../Player").position
	for i in 3:
		var particle2 = particlePre.instantiate()
		get_parent().add_child(particle2)
		particle2.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle2.position = get_node("../Earth").position
		get_node("../Player/Sprite2D").modulate.a = 0
		get_node("../Earth/Sprite2D").modulate.a = 0
	#get_node("../Enemy1/Sprite2D").modulate.a = 0

func _physics_process(delta):
	if (Global.alive == false):
		timer += delta
	match Global.lives:
		3:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(8)
		2:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(9)
		1:
			$Life1.set_frame(8)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
		0:
			$Life1.set_frame(9)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
			death()

	if (timer > 2):
		Global.lives = -1
	if (timer > 3):
		get_node('../score_keeping').modulate.a = 0
		get_node('../play').modulate.a = 255
		get_node('../last_score').modulate.a = 255
		if(Input.is_action_just_pressed("ui_accept")):
			Global.alive = true
			Global.score = 0
			Global.lives = 3
			get_tree().reload_current_scene()

��b�rx�S��extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	text = "Score : " + str(Global.score)
&����ϯ�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script    res://World/enemy_spawn.gd ��������
   Texture2D    res://World/BG1.png g����3:   Script    res://World/Lives.gd ��������
   Texture2D     res://Enemies/enemy_sprites.png �^�L�K   Script    res://Player/Player.gd ��������
   Texture2D $   res://Player/Player_Ship_Sprite.png �*܀mA   Script    res://World/score.gd ��������   Script    res://World/last_score.gd ��������      local://CircleShape2D_umpkw �         local://PackedScene_f0ars �         CircleShape2D            �@         PackedScene          	         names "   $      World    script    Node2D    Bg1    z_index 	   position    scale    texture 	   Sprite2D    Lives    Life1    vframes    frame    Life2    Life3    Player    metadata/_edit_group_    CharacterBody2D    hframes    CollisionPolygon2D    polygon    Earth    StaticBody2D    CollisionShape2D    shape    score_keeping    offset_left    offset_top    offset_right    offset_bottom    text    Label    play 	   modulate    last_score $   theme_override_font_sizes/font_size    	   variants    '                ����
      C  �B
   ��>��>                  
     �A  �A            
         
      B  �A
     �B  �A
      C  �B                                    %            ��   A  �?  �@  �@  ��  �@   �  �?
      @   @               aC     @@    ��C     �A   	   Score :                �?  �?  �?         �B     �B     vC     �B      Press space ␣ to play!      �B     �B     OC     �B      Your last score :                 node_count             nodes     �   ��������       ����                            ����                                          	   ����                       
   ����                        	                    ����      
                  	                    ����                        	                     ����                                      ����                                            ����                           ����                           	             ����                   	             ����                           ����                                                          ����   !                                                    "   ����   !         !      "      #      $   #         %      &             conn_count              conns               node_paths              editable_instances              version             RSRC˟���]�RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_2eixy e	         Sky             Environment                                RSRC����O5p[G�X��extends Node

var score = 0
var lives = 3
var alive = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
�o��Z=�hT�M         h     (                                                                                                                           �   �   �   �   �   �                                   �   �������������������������   �   �                       ��jX��jX��jX��jX��jX��jX��jX�������������   �                   ��jX��jX��jX��jX�^�X�^�X��jX��jX��jX��jX�   �               �^�X��jX��jX��jX�^�X�^�X�^�X��jX��jX��jX��jX��jX�   �           �^�X��jX��jX�^�X�^�X�^�X�^�X��jX��jX��jX�^�X��jX�   �           ��jX��jX��jX��jX�^�X�^�X�^�X�^�X��jX�^�X�^�X�^�X�   �           ��jX��jX��jX��jX��jX��jX�^�X�^�X�^�X�^�X�^�X�^�X�   �           �^�X��jX��jX��jX�^�X��jX�^�X�^�X�^�X�^�X��jX��jX�   �           �^�X��jX��jX��jX�^�X�^�X�^�X�^�X�^�X�^�X�^�X�^�X�   �               �^�X��jX�^�X�^�X�^�X�^�X�^�X�^�X�^�X�^�X�   �                   ��������������jX��jX�^�X�^�X�^�X�^�X�^�X�   �                       �   �������������������������   �   �                                   �   �   �   �   �   �                                                                                    ��  �  �  �  �  �  �  �  �  �  �  �  �  �  �  ��  e{         h     (                                                                                                           �   �           �   �   �   �   �   �           �   �           �   �   �   �ppp�ppp�ppp�ppp�ppp�ppp�   �   �   �   �       �������������������������ppp�ppp�������������������������   �   ���������������������������������������������������������   �       �   �����������������������������������������   �   �                   ���������������������������������   �                               �������������������������   �                                       �����������������   �                                           �����������������   �                                           �����������������   �                                           �����������������   �                                           �����������������   �                                               ���������   �                                                       �   �                                                                                            ��  �  �          �  �  �  �  �  �  �  �  �?  �  ��  �[remap]

path="res://.godot/exported/133200997/export-b3a26ca6175bec0d7ef99f5fbb96b6d9-enemy_1.scn"
A>��[�ww��[remap]

path="res://.godot/exported/133200997/export-b14855f508c3dd2de5972f58a38bd544-particle.scn"
���H�C�z��[remap]

path="res://.godot/exported/133200997/export-6dd23c115fe37d07d4eed2f5dd25d7d0-bullet.scn"
�ϝ�.zR��e�LW[remap]

path="res://.godot/exported/133200997/export-7eea91d733d6cc73c5409a803f945015-jet.scn"
[remap]

path="res://.godot/exported/133200997/export-de71c21559ba3535c3f0645ed0c93644-World.scn"
;N�Qh��%j�`;�[remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
+��.�kÍlist=Array[Dictionary]([])
�L�   ۺ��d   res://Enemies/enemy_1.tscn�^�L�K   res://Enemies/enemy_sprites.png95�Q��HO   res://Enemies/particle.tscn��w�Hݚc   res://Icon/Icon1.pngq���w�   res://Icon/Icon2.png�����x   res://Player/bullet.tscn��O_��   res://Player/jet.tscn�*܀mA#   res://Player/Player_Ship_Sprite.pngg����3:   res://World/BG1.png��oD:FL   res://World/World.tscnz5A4���F   res://default_env.tres���av	UK1�h�ECFG      application/config/name      
   2D Shooter     application/run/main_scene          res://World/World.tscn     application/config/features   "         4.1    autoload/Global         *res://global.gd"   display/window/size/viewport_width      @  #   display/window/size/viewport_height      �   )   display/window/size/window_width_override         *   display/window/size/window_height_override      �     display/window/stretch/scale        �@   display/window/dpi/allow_hidpi             input/ui_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode     @    physical_keycode       	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       ��   script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script         input/ui_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode     @    physical_keycode       	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       �?   script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script         input/ui_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode     @    physical_keycode       	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       ��   script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script         input/ui_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode     @    physical_keycode       	   key_label             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       �?   script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script      )   physics/common/enable_pause_aware_picking         9   rendering/textures/canvas_textures/default_texture_filter          2   rendering/environment/defaults/default_environment          res://default_env.tres  