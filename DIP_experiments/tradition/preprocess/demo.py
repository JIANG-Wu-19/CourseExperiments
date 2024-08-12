import cv2
import numpy as np

# 读取图像
image = cv2.imread('train/0.jpg')

# 将图像转换为灰度
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# 应用高斯模糊以减少噪声并帮助边缘检测
blurred = cv2.GaussianBlur(gray, (5, 5), 0)

# 使用Canny边缘检测器查找图像中的边缘
edges = cv2.Canny(blurred, 50, 150)

# 在边缘图中查找轮廓
contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)


# 创建一个黑色背景图像
contour_image = np.zeros_like(image)

# 在黑色背景上绘制轮廓
cv2.drawContours(contour_image, contours, -1, (0, 255, 0), 2)

# 将轮廓图与原始图像融合
alpha = 0.3  # 调整融合的权重
result = cv2.addWeighted(image, 1 - alpha, contour_image, alpha, 0)

# 显示原始图像和轮廓图像
# cv2.imshow('原始图像', image)
# cv2.imshow('轮廓图像', contour_image)

cv2.imwrite('test.jpg',result)
