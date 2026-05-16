import 'package:radar_emas/features/chart/data/dto/gold_price_dto.dart';
import 'package:radar_emas/features/chart/domain/entities/gold_price.dart';

class GoldPriceMapper {
  const GoldPriceMapper();
  GoldPrice toEntity(GoldPriceDto dto) {
    return GoldPrice(
      source: dto.source,
      material: dto.material,
      materialType: dto.materialType,
      weight: dto.weight,
      weightUnit: dto.weightUnit,
      sellPrice: dto.sellPrice,
      buybackPrice: dto.buybackPrice,
      currency: dto.currency,
      recordedDate: dto.recordedDate,
      lineKey: dto.lineKey,
    );
  }

  List<GoldPrice> toEntityList(List<GoldPriceDto> dtos) {
    return dtos.map(toEntity).toList();
  }
}
