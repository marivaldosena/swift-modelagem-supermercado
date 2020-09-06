import UIKit


//MARK: - Categoria
/// Categoria de produtos, tais como: Mercados e Afins, Restaurantes, Qualquer Coisa.
class Categoria {
    // Atributos
    var nomeCategoria: String
    var produtos: [Produto]
    var descricao: String
    var estabelecimentos: [Estabelecimento]
    
    /// Inicializa uma determinada categoria.
    ///
    /// - parameter nomeCategoria: Nome da categoria
    /// - parameter descricao: Descrição breve da categoria
    ///
    /// # Notes: #
    ///
    /// Essa categoria é genérica e fica em um dos maiores níveis hierárquicos da aplicação.
    ///
    /// # Example #
    ///
    /// ```
    /// let categoria = Categoria(
    ///         nomeCategoria: "Mercados & Afins",
    ///         descricao: "Rápido e prático como tem que ser"
    ///     )
    /// ```
    init(nomeCategoria: String, descricao: String) {
        self.nomeCategoria = nomeCategoria
        self.descricao = descricao
        self.produtos = []
        self.estabelecimentos = []
    }
    
    // TODO: Implementar descrição
    func incluirProduto(produto: Produto) {
        self.produtos.append(produto)
    }
    
    // TODO: Implementar descrição
    func removerProduto(produto: Produto) {
        self.produtos = self.produtos.filter { $0.nomeProduto.lowercased() != produto.nomeProduto.lowercased() }
    }
    
    // TODO: Implementar descrição
    func procurarProduto(produto: Produto) -> Int {
        for (index, item) in self.produtos.enumerated() {
            if item.nomeProduto.lowercased() == produto.nomeProduto.lowercased() || item.id == produto.id {
                return index
            }
        }
        
        return -1
    }
    
    // TODO: Implementar descrição
    func incluirEstabelecimento(estabelecimento: Estabelecimento) {
        self.estabelecimentos.append(estabelecimento)
    }
    
    // TODO: Implementar descrição
    func removerEstabelecimento(estabelecimento: Estabelecimento) {
        self.estabelecimentos = self.estabelecimentos.filter { (item) in
            return !(item.endereco.cep != estabelecimento.endereco.cep && item.endereco.numero != estabelecimento.endereco.numero)
        }
    }
}

//MARK: - Endereço
class Endereco {
    var logradouro: String
    var numero: Int?
    var nome: String
    var cep: String
    
    init(nome: String, numero: Int?, logradouro: String, cep: String) {
        self.nome = nome
        self.numero = numero
        self.logradouro = logradouro
        self.cep = cep
    }
}

//MARK: - Estabelecimento
class Estabelecimento {
    var endereco: Endereco
    
    init(endereco: Endereco) {
        self.endereco = endereco
    }
    
}

//MARK: - Restaurante
class Restaurante: Estabelecimento {
    
}

//MARK: - Supermercado
class Supermercado: Estabelecimento {
    
}

//MARK: - Imagem
class Imagem {
    var url: String
    var titulo: String
    var descricao: String
    var altura: Double
    var largura: Double
    var extensao: String
    
    init(titulo: String, url: String, descricao: String, altura: Double, largura: Double, extensao: String) {
        self.titulo = titulo
        self.url = url
        self.descricao = descricao
        self.altura = altura
        self.largura = largura
        self.extensao = extensao
    }
}

//MARK: - Produto
class Produto {
    var id: Int
    var frete: Double
    var nomeProduto: String
    var tempoDeEntrega: String
    var imagens: [Imagem]
    var tipoProduto: TipoProduto
    var valorProduto: Double
    
    init(id: Int, nomeProduto: String, frete: Double, tipoProduto: TipoProduto, valorProduto: Double, tempoEntrega: String) {
        self.id = id
        self.nomeProduto = nomeProduto
        self.frete = frete
        self.imagens = []
        self.tempoDeEntrega = tempoEntrega
        self.tipoProduto = tipoProduto
        self.valorProduto = valorProduto
    }
    
    func incluirImagem(imagem: Imagem) {
        self.imagens.append(imagem)
    }
    
    func removerImagem(imagem: Imagem) {
        self.imagens = self.imagens.filter { $0.url.lowercased() != imagem.url.lowercased() }
    }
    
    func alterarNomeProduto(de antigoNome: String, para novoNome: String) {
        
    }
}

enum TipoProduto {
    case Lanche
    case NaoPerecivel
    case Perecivel
}

//MARK: - Instanciação
let categoria = Categoria(nomeCategoria: "Mercados & Afins", descricao: "Rápido e prático como tem que ser")
print(categoria.nomeCategoria)
