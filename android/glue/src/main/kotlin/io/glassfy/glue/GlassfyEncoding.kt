package io.glassfy.glue

import io.glassfy.androidsdk.model.*
import org.json.JSONArray
import org.json.JSONObject
import java.text.DateFormat
import java.text.SimpleDateFormat

fun encodeArray(array:List<JSONObject>):JSONArray {
    val all = JSONArray()
    array.forEach {
        all.put(it)
    }
    return all
}

fun encodeStringArray(array:List<String>):JSONArray {
    val all = JSONArray()
    array.forEach {
        all.put(it)
    }
    return all
}

fun Offering.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("offeringId",this.offeringId)

    val skus = encodeArray(this.skus.map { it.encodedJson()})
    jo.put("skus",skus)
    return jo
}

fun Offerings.encodedJson(): JSONObject {
    val jo = JSONObject()
    val all = encodeArray(this.all.map { it.encodedJson()})
    jo.put("all",all)
    return jo
}

fun AccountableSku.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId",this.skuId)
    jo.put("productId",this.productId)
    jo.put("store",this.store.value)

    jo.put("isInIntroOfferPeriod",this.isInIntroOfferPeriod)
    jo.put("isInTrialPeriod",this.isInTrialPeriod)

    return jo;
}

fun Permission.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("permissionId",this.permissionId)
    jo.put("entitlement",this.entitlement.value)
    jo.put("isValid",this.isValid)
    jo.put("expireDate",this.expireDate)
    jo.put("accountableSkus",encodeArray(this.accountableSkus.map { it.encodedJson()}))
    return jo
}

fun Permissions.encodedJson(): JSONObject {
    val jo = JSONObject()
    val permissions = encodeArray(this.all.map { it.encodedJson() })
    jo.put("subscriberId",subscriberId)
    jo.put("all",permissions)
    return jo
}

fun Sku.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId",this.skuId)
    jo.put("productId",this.productId)
    jo.put("store",this.store.value)
    jo.put("extravars",JSONObject(this.extravars))
    jo.put("product",this.product.encodedJson())
    return jo
}

fun SkuPaddle.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId", this.skuId)
    jo.put("productId", this.productId)
    jo.put("store", this.store.value)
    jo.put("extravars", JSONObject(this.extravars))

    jo.put("name", this.name)
    jo.put("initialPrice", this.initialPrice)
    jo.put("initialPriceCode", this.initialPriceCode)

    jo.put("recurringPrice", this.recurringPrice)
    jo.put("recurringPriceCode", this.recurringPriceCode)
    return jo
}

fun SkuBase.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId",this.skuId)
    jo.put("productId",this.productId)
    jo.put("store",this.store.value)
    return jo;
}

fun ISkuBase.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId",this.skuId)
    jo.put("productId",this.productId)
    jo.put("store",this.store.value)
    return jo;
}

fun Transaction.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("permissions", this.permissions.encodedJson())
    return jo
}

fun skuFromJsonObject(jo: JSONObject):Sku {
    val skuId = jo.optString("skuId")
    val productId = jo.optString("productId")

    return Sku(skuId,productId, emptyMap<String, String>(), null)
}

fun attributionItemFromJsonObject(jo: JSONObject): AttributionItem? {
    val joType = jo.optInt("type",-1)

    val type = attributionItemTypeFromValue(joType)
    val value = jo.optString("value")

    return if (type != null) AttributionItem(type, value) else null
}

fun attributionItemsFromJsonArray(ja: JSONArray): List<AttributionItem> {
    val items = mutableListOf<AttributionItem>()
    for (i in 0 until ja.length()) {
        val jo = ja.getJSONObject(i)
        attributionItemFromJsonObject(jo)?.let { item ->
            items.add(item)
        }
    }
    return items
}

fun attributionItemTypeFromValue(value: Int): AttributionItem.Type? =
    when (value) {
        1 -> AttributionItem.Type.AdjustID
        2 -> AttributionItem.Type.AppsFlyerID
        3 -> AttributionItem.Type.IP
        6 -> AttributionItem.Type.GAID
        else -> null
    }

fun SkuDetails.encodedJson():JSONObject{
    val jo = JSONObject()

    jo.put("identifier", this.sku)
    jo.put("description", this.description)
    jo.put("title", this.title)
    jo.put("price",this.priceAmountMicro / 1000000.0)
    jo.put("currencyCode", this.priceCurrencyCode)

    if (this.freeTrialPeriod.isNotBlank()) {
        val ftjo = JSONObject()

        ftjo.put("price",0)
        ftjo.put("period",this.freeTrialPeriod)
        ftjo.put("numberOfPeriods",1)
        ftjo.put("type","introductory")
        ftjo.put("currencyCode", this.priceCurrencyCode)
        ftjo.put("identifier", this.sku)

        jo.put("introductoryPrice",ftjo)
    } else if (introductoryPrice.isNotBlank()) {
        val ipjo = JSONObject()
        ipjo.put("price",introductoryPriceAmountMicro / 1000000.0)
        ipjo.put("period",introductoryPriceAmountPeriod)
        ipjo.put("numberOfPeriods",introductoryPriceAmountCycles)
        ipjo.put("type","introductory")
        ipjo.put("currencyCode", this.priceCurrencyCode)
        ipjo.put("identifier", this.sku)

        jo.put("introductoryPrice",ipjo)
    }
    return jo;
}

fun UserProperties.encodedJson():JSONObject {
    val jo = JSONObject()
    jo.put("email",this.email)
    jo.put("token",this.token)
    jo.put("extra",this.extra)
    return jo;
}