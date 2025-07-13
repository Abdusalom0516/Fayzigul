import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/core/common/consts/const_texts.dart';
import 'package:plant_store/core/utils/toastification.dart';
import 'package:plant_store/features/cart/data/datasources/transactions_remote_datasource.dart';
import 'package:plant_store/features/cart/data/repositories/transactions_repository_implementation.dart';
import 'package:plant_store/features/cart/domain/usecases/get_transactions_usecase.dart';
import 'package:plant_store/features/cart/domain/usecases/save_transaction_usecase.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc_events.dart';
import 'package:plant_store/features/cart/presentation/blocs/checkout/checkout_bloc_states.dart';

class CheckoutBloc extends Bloc<CheckoutBlocEvents, CheckoutBlocStates> {
  CheckoutBloc() : super(CheckoutBlocStates(transactionsList: [])) {
    final repository = TransactionsRepositoryImplementation(
        remoteDatasource: TransactionsRemoteDatasource());
    final saveSearchHistoryUsecase =
        SaveTransactionUsecase(repository: repository);

    final getTransactionsUsecase =
        GetTransactionsUsecase(repository: repository);

    on<OnCheckoutClicked>(
      (event, emit) async {
        final texts = ConstTexts();
        if (event.transactionsModel.address.isEmpty) {
          Toastification.warning(event.context, texts.addressCanNotBeEmpty);
          return;
        }

        if (event.transactionsModel.email.isEmpty) {
          Toastification.warning(event.context, texts.emailCanNotBeEmpty);
          return;
        }

        if (event.transactionsModel.phoneNumber.isEmpty) {
          Toastification.warning(event.context, texts.phoneNumberCanNotBeEmpty);
          return;
        }

        if (event.transactionsModel.username.isEmpty) {
          Toastification.warning(event.context, texts.usernameCanNotBeEmpty);
          return;
        }
        
        await saveSearchHistoryUsecase(transaction: event.transactionsModel);
      },
    );

    on<OnGetTransactionsClicked>(
      (event, emit) async {
        emit(state.copyWith(await getTransactionsUsecase()));
      },
    );
  }
}
