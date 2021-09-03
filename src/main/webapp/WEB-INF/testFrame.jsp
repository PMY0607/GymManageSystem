<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    update place_info
 <trim prefix="set" suffixOverrides=",">
  <if test="type!=null">type=#{type.id},</if>
  <if test="imgSrc!=null">img_src=#{imgSrc},</if>
  <if test="status!=null">status=#{status},</if>
  <if test="note!=null">note=#{note},</if>
 </trim>
 WHERE id=#{id}
</script>


    <script>
            insert into place_info
        <trim prefix="(" suffix=")" suffixOverrides="," >
          <if test='type.id!=null'>
                type,
          </if>
         <if test='imgSrc!=null'>
             img_src,
         </if>
         <if test='status!=null'>
             status,
         </if>
         <if test='note!=null'>
             note,
         </if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides="," >
            <if test='type.id!=null'>
                #{type},
            </if>
            <if test='imgSrc!=null'>
                #{imgSrc},
            </if>
            <if test='status!=null'>
                #{status},
            </if>
            <if test='note!=null'>
                #{note},
            </if>
        </trim>
    </script>
</body>
</html>
