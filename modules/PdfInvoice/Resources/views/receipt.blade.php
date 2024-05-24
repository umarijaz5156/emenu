<div class="modal  fade " id="modalPOSInvoice" tabindex="-1" role="dialog" aria-labelledby="modal-default"
    aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">{{ __('POS Invoice') }}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                <div id="posRecipt" class="ml-1">

                    <center id="header">
                        <div class="name">
                            <h2>{{ __('EmenuSoluitions') }} #{{ $order->id }}</h2>
                            <h3>{{ $order->restorant->name }}</h3>
                            <div class="text-center font-weight-bold">@{{ order ? order.time_created : "" }}</div>
                            <div class="text-center">{{ $order->restorant->address }} {{ $order->restorant->city }}
                                {{ $order->restorant->zipcode }}</div>
                            <div class="text-center">{{ $order->restorant->phone }}</div>
                            <hr>

                            <h4>Customer: {{ $order->client->name ?? '' }}</h4>
                            <h4>Phone: {{ $order->client->phone ?? '' }} </h4>

                            <div>Comment: {{ $order->comment }} </div>
                        </div>
                    </center>
                    <div v-if="order&&order.delivery_method!=3" v-cloak class="blockDelivery">
                        <p v-if="order&&order.delivery_method==1" v-cloak>{{ __('Delivery order') }}</p>
                        <p v-if="order&&order.delivery_method==2" v-cloak>{{ __('Pickup order') }}</p>
                        <p>{{ __('Client name') }}: @{{ order ? order.configs.client_name : "" }}</p>
                        <p>{{ __('Client phone') }}: @{{ order.phone.length > 3 ? order.phone : (order && order.configs.client_phone ? order.configs.client_phone : "") }}</p>
                        <p>{{ __('Time') }}: @{{ order ? order.time_formated : "" }}</p>
                        <p v-if="delivery_method==1" v-cloak>{{ __('Client address') }}: @{{ order ? order.whatsapp_address : "" }}</p>
                    </div>

                    <div v-if="order&&order.delivery_method==3" v-cloak class="blockDinein">
                        <div class="text-center">{{ __('Area') }}: @{{ order && order.tableassigned && order.tableassigned[0] && order.tableassigned[0].restoarea ? order.tableassigned[0].restoarea.name : "" }}</div>
                        <div class="text-center">{{ __('Table') }}: @{{ order && order.tableassigned && order.tableassigned[0] ? order.tableassigned[0].name : "" }}</div>
                    </div>

                    <hr>

                    <div class="table-responsive w-100">
                        <table class="w-100">
                            <thead>
                                <tr>
                                    <th class="col-2" scope="col">{{ __('Qty') }}</th>
                                    <th class="col-8" scope="col">{{ __('Item') }}</th>
                                    <th class="col-2" scope="col">{{ __('Subtotal') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="item in (order?order.items:[])" class="border-bottom">
                                    <td>@{{ item.pivot.qty }} X </td>

                                    <td>@{{ item.name + " " + item.pivot.variant_name + showIt(item.pivot.extras) }}</td>

                                    <td>@{{ formatPrice(item.pivot.qty * item.pivot.variant_price) }}</td>
                                </tr>
                                {{-- <tr>
                                    <th></th>
                                    <th>{{ __('Tax inc.') }}</th>
                                    <td>@{{ order ? formatPrice(parseFloat(order.vatvalue).toFixed(2)) : "" }}</td>
                                </tr> --}}
                                {{-- <tr v-if="order&&order.delivery_method==1" class="blockDelivery">
                                    <th></th>
                                    <th>{{ __('Delivery') }}</th>
                                    <td>@{{ order ? formatPrice(parseFloat(order.delivery_price).toFixed(2)) : "" }}</td>
                                </tr> --}}
                                {{-- <tr v-if="order&&order.discount>0" class="blockDelivery">
                                    <th></th>
                                    <th>{{ __('Discount') }}</th>
                                    <td>@{{ order ? formatPrice(parseFloat(order.discount).toFixed(2)) : "" }}</td>
                                </tr>
                                <tr v-if="order&&order.tip>0" class="blockDelivery">
                                    <th></th>
                                    <th>{{ __('Tip') }}</th>
                                    <td>@{{ order ? formatPrice(parseFloat(order.tip).toFixed(2)) : "" }}</td>
                                </tr> --}}
                            </tbody>
                        </table>
                        <table id="totalInModal" class="mt-2 w-100">
                            <tbody>
                                {{-- subtotal --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Subtotal') }}</th>
                                    <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(parseFloat(order.order_price) + parseFloat(order.discount)).toFixed(2)) : "" }}</th>
                                    {{-- <th class="p-1 w-30">asas {{ $order->order_price }} </th> --}}
                                </tr>

                                {{-- discount --}}
                                @if ($order->discount > 0)
                                    <tr>
                                        <th class="p-1 w-70">{{ __('Discount') }}</th>
                                        <th class="p-1 w-30">-@{{ order ? formatPrice(parseFloat(order.discount).toFixed(2)) : "" }}</th>
                                    </tr>
                                @endif

                                {{-- coupon code --}}
                                @if ($order->discount)
                                    <tr>
                                        <th class="p-1 w-70">{{ __('Coupon code') }}</th>
                                        <th class="p-1 w-30">@{{ order ? order.coupon : "" }}</th>
                                    </tr>
                                @endif

                                {{-- sub total after discount --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Subtotal after discount') }}</th>
                                    <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(order.order_price).toFixed(2)) : "" }}</th>
                                </tr>

                                {{-- Tax --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Tax') }}</th>
                                    <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(order.vatvalue).toFixed(2)) : "" }}</th>
                                </tr>

                                {{-- Delivery --}}
                                @if ($order->delivery_method == 1)
                                    <tr>
                                        <th class="p-1 w-70">{{ __('Delivery') }}</th>
                                        <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(order.delivery_price).toFixed(2)) : "" }}</th>
                                    </tr>
                                @endif

                                {{-- tip --}}
                                @if ($order->tip > 0)
                                    <tr>
                                        <th class="p-1 w-70">{{ __('Tip') }}</th>
                                        <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(order.tip).toFixed(2)) : "" }}</th>
                                    </tr>
                                @endif

                                {{-- total --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Total') }}
                                        {{ $order->payment_method == 'cod' ? 'due' : 'paid' }}</th>
                                    <th class="p-1 w-30">@{{ order ? formatPrice(parseFloat(parseFloat(order.order_price) + parseFloat(order.delivery_price) + parseFloat(order.tip)).toFixed(2)) : "" }}</th>
                                </tr>

                                {{-- payment method --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Payment method') }}</th>
                                    <th class="p-1 w-30">@{{ order ? order.payment_method : "" }}</th>
                                </tr>

                                {{-- payment status --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Payment status') }}</th>
                                    <th class="p-1 w-30">@{{ order ? order.payment_status : "" }}</th>
                                </tr>

                                {{-- dinein method --}}
                                <tr>
                                    <th class="p-1 w-70">{{ __('Dinein method') }}</th>
                                    <th class="p-1 w-30">{{ $order->getExpeditionType() }}
                                    </th>
                                </tr>
                            </tbody>
                        </table>

                        <div class="text-center" v-if="order&&order.payment_link">
                            <br />
                            <p>{{ __('Scan to pay') }}</p>

                            <a :href="order.payment_link" target="_blank">
                                <img :src="'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + order.payment_link"
                                    class="image mr-3" alt="" />
                            </a>
                            <br /><br />
                        </div>

                    </div>
                </div>


                <div class="modal-footer">

                    <button type="button" class="btn btn-link  ml-auto"
                        data-dismiss="modal">{{ __('Close') }}</button>
                    <button type="button" id="printPos" class="btn btn-primary">{{ __('Print') }}</button>


                </div>
            </div>
        </div>
    </div>
</div>
