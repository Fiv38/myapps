part of 'pos_bloc.dart';

@freezed
class PosState with _$PosState {
  const factory PosState.initial() = _Initial;
  const factory PosState.loading() = _Loading;
  const factory PosState.loaded() = _Loaded;
  const factory PosState.error() = _Error;
  const factory PosState.finish() = _Finish;
  const factory PosState.done() = _Done;
  const factory PosState.reset() = _Reset;
  const factory PosState.updated({required String message}) = _Updated;
  //Cart
  const factory PosState.loadingRemoveCart() = _LoadingRemoveCart;
  const factory PosState.addedCart() = _AddedCart;

  //Add Service
  const factory PosState.loadingService() = _LoadingService;
  const factory PosState.addedService() = _AddedService;

  //Delete Service
  const factory PosState.deleteService() = _DeleteService;

  //Edit Service
  const factory PosState.editService() = _EditService;

  const factory PosState.loadingSaveToDB() = _LoadingSaveToDB;
  const factory PosState.finishSaveToDB() = _FinishSaveToDB;


}
