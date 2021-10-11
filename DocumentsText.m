function documents = DocumentsText(textData)

% Metni simge haline getirir
documents = tokenizedDocument(textData);

%Küçük harf dönüştürülüyor
documents = lower(documents);

% Noktalama işaretlerini siler
documents = erasePunctuation(documents);

end