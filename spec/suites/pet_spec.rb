require_relative "../../app/pet.rb"

describe "Pets store" do
    subject (:pet_chamadas) {PetApi.new}
    let(:dados_pet) { attributes_for(:Addpet) }

    context "Adicionar Pet"do
            it "Adicionar um novo pet" do
            result = pet_chamadas.pet_add(dados_pet)
            dados_pet[:id] = result['id']
            expect(result.code).to eq(200)
            expect(result["name"]).to eq(dados_pet[:name])
            expect(result["id"]).to eq(dados_pet[:id])
        end
    end
    context "Buscar Pet"do
        it "buscar pet por id"do
            result = pet_chamadas.pet_add(dados_pet)
            dados_pet[:id] = result['id']
            result_ge_id = pet_chamadas.pet_get_id(dados_pet[:id])
            expect(result_ge_id.code).to eq(200)
            expect(result_ge_id["id"]).to eq(dados_pet[:id])
        end
        it "buscar id inválid"do #* Dando merda
            result = pet_chamadas.pet_add(dados_pet)
            result_ge_id = pet_chamadas.pet_get_idi(922337203685477580)
            expect(result_ge_id['message']).to eq("message")
            expect(result_ge_id["Pet not found"]).to eq("Pet not found")
        end
        it "buscar status"do
            result_add = pet_chamadas.pet_add(dados_pet)
            result_add['id'] 
            result_get = pet_chamadas.pet_get_status(dados_pet[:status])
            meu_cadastro = result_get.select{ |valor| valor["id"] == result_add['id']} 
            expect(result_get.code).to eq(200)
            expect(meu_cadastro[0]["id"]).to eq(result_add['id'])
        end
        
    end
    context "Atualizar pet" do
        it "Atualizar dados do cadastro do pet form"do
            result = pet_chamadas.pet_add(dados_pet)
            result_atualiza = pet_chamadas.pet_update_id(result['id'],"simone_Editado", "pending")
            result_ge_id = pet_chamadas.pet_get_id(result['id'])
            expect(result_atualiza.code).to eq(200)
            expect(result_atualiza['message']).to eq("#{result['id']}")
            expect(result_ge_id['name']).to eq("simone_Editado")
            expect(result_ge_id['status']).to eq("pending")
        end

        it "Atualizar dados pet "do
            result = pet_chamadas.pet_add(dados_pet)
            dados_pet[:id] = result['id']
            dados_pet[:name] = "Simoneok"
            dados_pet[:id] = 1236
            result_atualiza_put = pet_chamadas.pet_updare_put(dados_pet)
            expect(result_atualiza_put.code).to eq(200)
            expect(result_atualiza_put['name']).to eq('Simoneok')
            expect(result_atualiza_put['id']).to eq(1236)
        end
    end
    context "Delete Pet"do
            it "Deletar um pet por id" do
            result = pet_chamadas.pet_add(dados_pet)
            dados_pet[:id] = result['id']
            result_delete = pet_chamadas.delete_pet_id(dados_pet[:id])
            expect(result_delete.code).to eq(200)
            expect(result_delete['message']).to eq("#{dados_pet[:id]}")
        end

        xit "Deletar um pet por id inválido" do
            result = pet_chamadas.pet_add(dados_pet)
            dados_pet[:id] = result['id']
            puts dados_pet[:id] = 1237
            puts result_delete = pet_chamadas.delete_pet_id(dados_pet[:id])
            expect(result_delete.code).to eq(404)
        end

        xit "Deletar dados da base" do
            result = pet_chamadas.pet_add(dados_pet)
            puts dados_pet[:id] = result['id']
            result_get = pet_chamadas.pet_get_status(dados_pet[:status])
            puts teste = dados_pet[:id]  = result_get[0]["id"]
            while dados_pet[:id]  <= teste do
                result_delete = pet_chamadas.delete_pet_id(teste)
                result_get = pet_chamadas.pet_get_status(dados_pet[:status])
                teste = dados_pet[:id]  = result_get[0]["id"]
                puts "passou aqui"
            end
            
        end
    end
    
end