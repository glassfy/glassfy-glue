package io.glassfy.glue

import io.glassfy.androidsdk.model.AccountableSku
import io.glassfy.androidsdk.model.AttributionItem
import io.glassfy.androidsdk.model.ISkuBase
import io.glassfy.androidsdk.model.Offering
import io.glassfy.androidsdk.model.Offerings
import io.glassfy.androidsdk.model.Permission
import io.glassfy.androidsdk.model.Permissions
import io.glassfy.androidsdk.model.PurchaseHistory
import io.glassfy.androidsdk.model.PurchasesHistory
import io.glassfy.androidsdk.model.Sku
import io.glassfy.androidsdk.model.SkuBase
import io.glassfy.androidsdk.model.SkuDetails
import io.glassfy.androidsdk.model.SkuPaddle
import io.glassfy.androidsdk.model.Transaction
import io.glassfy.androidsdk.model.UserProperties
import org.json.JSONArray
import org.json.JSONObject

fun encodeArray(array: List<JSONObject>): JSONArray {
    val all = JSONArray()
    array.forEach {
        all.put(it)
    }
    return all
}

fun encodeStringArray(array: List<String>): JSONArray {
    val all = JSONArray()
    array.forEach {
        all.put(it)
    }
    return all
}

fun Offering.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("offeringId", this.offeringId)

    val skus = encodeArray(this.skus.map { it.encodedJson() })
    jo.put("skus", skus)
    return jo
}

fun Offerings.encodedJson(): JSONObject {
    val jo = JSONObject()
    val all = encodeArray(this.all.map { it.encodedJson() })
    jo.put("all", all)
    return jo
}

fun PurchasesHistory.encodedJson(): JSONObject {
    val jo = JSONObject()
    val all = encodeArray(this.all.map { it.encodedJson() })
    jo.put("all", all)
    return jo
}

fun PurchaseHistory.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("productId", productId)
    jo.put("skuId", skuId)
    jo.put("type", type.value)
    jo.put("store", store.value)
    jo.put("transactionId", transactionId)
    jo.put("subscriberId", subscriberId)
    jo.put("currencyCode", currencyCode)
    jo.put("countryCode", countryCode)
    jo.put("isInIntroOfferPeriod", isInIntroOfferPeriod)
    jo.put("promotionalOfferId", promotionalOfferId)
    jo.put("offerCodeRefName", offerCodeRefName)
    jo.put("licenseCode", licenseCode)
    jo.put("webOrderLineItemId", webOrderLineItemId)

    purchaseDate?.time?.let {
        jo.put("purchaseDate", it / 1000L)
    }
    expireDate?.time?.let {
        jo.put("expireDate", it / 1000L)
    }
    return jo
}

fun AccountableSku.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId", this.skuId)
    jo.put("productId", this.productId)
    jo.put("store", this.store.value)
    jo.put("isInIntroOfferPeriod", this.isInIntroOfferPeriod)
    jo.put("isInTrialPeriod", this.isInTrialPeriod)
    jo.put("basePlanId", this.basePlanId)
    jo.put("offerId", this.offerId)
    return jo;
}

fun Permission.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("permissionId", this.permissionId)
    jo.put("entitlement", this.entitlement.value)
    jo.put("isValid", this.isValid)
    jo.put("expireDate", this.expireDate)
    jo.put("accountableSkus", encodeArray(this.accountableSkus.map { it.encodedJson() }))
    return jo
}

fun Permissions.encodedJson(): JSONObject {
    val jo = JSONObject()
    val permissions = encodeArray(this.all.map { it.encodedJson() })
    jo.put("subscriberId", subscriberId)
    jo.put("all", permissions)
    return jo
}

fun Sku.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId", this.skuId)
    jo.put("productId", this.productId)
    jo.put("basePlanId", this.basePlanId)
    jo.put("offerId", this.offerId)

    jo.put("store", this.store.value)
    jo.put("extravars", JSONObject(this.extravars))

    val productJo = this.product.encodedJson()
    jo.put("product", productJo)

    if (productJo.has("introductoryPrice")) {
        jo.put("introductoryEligibility", true)
    }
    productJo.optJSONArray("discounts")?.optJSONObject(0)?.let {
        jo.put("discount", it)
        jo.put("promotionalEligibility", true)
    }
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
    jo.put("skuId", this.skuId)
    jo.put("productId", this.productId)
    jo.put("store", this.store.value)
    return jo;
}

fun ISkuBase.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("skuId", this.skuId)
    jo.put("productId", this.productId)
    jo.put("store", this.store.value)
    return jo;
}

fun Transaction.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("permissions", this.permissions.encodedJson())
    return jo
}

fun attributionItemFromJsonObject(jo: JSONObject): AttributionItem? {
    val joType = jo.optInt("type", -1)

    val type = attributionItemTypeFromValue(joType)
    val value = jo.optString("value")

    return if (type != null) AttributionItem(type, value) else null
}

fun attributionItemTypeFromValue(value: Int): AttributionItem.Type? = when (value) {
    1 -> AttributionItem.Type.AdjustID
    2 -> AttributionItem.Type.AppsFlyerID
    3 -> AttributionItem.Type.IP
    6 -> AttributionItem.Type.GAID
    7 -> AttributionItem.Type.ASID
    8 -> AttributionItem.Type.AID
    else -> null
}

fun SkuDetails.encodedJson(): JSONObject {
    val jo = JSONObject()

    jo.put("identifier", this.sku)
    jo.put("description", this.description)
    jo.put("title", this.title)
    jo.put("price", this.priceAmountMicro / 1000000.0)
    jo.put("currencyCode", this.priceCurrencyCode)
    jo.put("period", this.subscriptionPeriod)
    jo.put("basePlanId", this.basePlanId)

    var ftjo: JSONObject? = null
    if (this.freeTrialPeriod.isNotBlank()) {
        ftjo = JSONObject()

        ftjo.put("price", 0)
        ftjo.put("period", this.freeTrialPeriod)
        ftjo.put("numberOfPeriods", 1)
        ftjo.put("type", "introductory")
        ftjo.put("currencyCode", this.priceCurrencyCode)
        ftjo.put("identifier", this.offerId)
    }

    var ipjo: JSONObject? = null
    if (introductoryPrice.isNotBlank()) {
        ipjo = JSONObject()

        ipjo.put("price", this.introductoryPriceAmountMicro / 1000000.0)
        ipjo.put("period", this.introductoryPriceAmountPeriod)
        ipjo.put("numberOfPeriods", this.introductoryPriceAmountCycles)
        ipjo.put("type", "introductory")
        ipjo.put("currencyCode", this.priceCurrencyCode)
        ipjo.put("identifier", this.offerId)
    }

    if (ftjo != null) {
        jo.put("introductoryPrice", ftjo)
        if (ipjo != null) {
            val dja = JSONArray()
            dja.put(ipjo);
            jo.put("discounts", dja)
        }
    } else {
        jo.put("introductoryPrice", ipjo)
    }

    return jo
}

fun UserProperties.encodedJson(): JSONObject {
    val jo = JSONObject()
    jo.put("email", this.email)
    jo.put("token", this.token)
    jo.put("extra", this.extra)
    return jo;
}