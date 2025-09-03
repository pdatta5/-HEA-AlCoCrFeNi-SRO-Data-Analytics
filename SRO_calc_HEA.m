

lattice_constant=3.60;
supersize=15;
nn_th_SRO=1;

data_file_path='.';

[data,infor_set] = read_lmp([data_file_path,'/HEA_MC1.data']);
index=data(1,:)';
types=data(2,:)';

coords=data(3:5,:)';

%% category
Fe_index=find(types==1);
Ni_index=find(types==2);
Cr_index=find(types==3);
Co_index=find(types==4);
Al_index=find(types==5);
% Ni_types=types(Ni_index);
% Co_types=types(Co_index);
% Cr_types=types(Cr_index);
Al_coords= coords(Al_index,:);
Co_coords= coords(Co_index,:);
Cr_coords= coords(Cr_index,:);
Fe_coords= coords(Fe_index,:);
Ni_coords= coords(Ni_index,:);
% Al atoms
Al_nn_type_set=zeros(length(Al_coords),200);% just give a large inital matrix
count=0;
for num_Al=1:length(Al_coords)
    central_coord=Al_coords(num_Al,:);
    [dis_value,index_nn] = nn_dis_count(central_coord,coords,lattice_constant,supersize,nn_th_SRO);


    for s=1:length(index_nn)

        Al_nn_type_set(num_Al,s)=types(index_nn(s));
    end
           
end

Co_nn_type_set=zeros(length(Co_coords),200);% just give a large inital matrix

for num_Co=1:length(Co_coords)
    central_coord=Co_coords(num_Co,:);
    [dis_value,index_nn] = nn_dis_count(central_coord,coords,lattice_constant,supersize,nn_th_SRO);

    for s=1:length(index_nn)

        Co_nn_type_set(num_Co,s)=types(index_nn(s));
    end
           
end

Cr_nn_type_set=zeros(length(Cr_coords),200);% just give a large inital matrix
for num_Cr=1:length(Cr_coords)
    central_coord=Cr_coords(num_Cr,:);
    [dis_value,index_nn] = nn_dis_count(central_coord,coords,lattice_constant,supersize,nn_th_SRO);

    for s=1:length(index_nn)

        Cr_nn_type_set(num_Cr,s)=types(index_nn(s));
    end
           
end

Fe_nn_type_set=zeros(length(Fe_coords),200);% just give a large inital matrix
count=0;
for num_Fe=1:length(Fe_coords)
    central_coord=Fe_coords(num_Fe,:);
    [dis_value,index_nn] = nn_dis_count(central_coord,coords,lattice_constant,supersize,nn_th_SRO);


    for s=1:length(index_nn)

        Fe_nn_type_set(num_Fe,s)=types(index_nn(s));
    end
           
end

Ni_nn_type_set=zeros(length(Ni_coords),200);% just give a large inital matrix
count=0;
for num_Ni=1:length(Ni_coords)
    central_coord=Ni_coords(num_Ni,:);
    [dis_value,index_nn] = nn_dis_count(central_coord,coords,lattice_constant,supersize,nn_th_SRO);


    for s=1:length(index_nn)

        Ni_nn_type_set(num_Ni,s)=types(index_nn(s));
    end
           
end

c_Al=length(Al_index)/length(index);
c_Co=length(Co_index)/length(index);
c_Cr=length(Cr_index)/length(index);
c_Fe=length(Fe_index)/length(index);
c_Ni=length(Ni_index)/length(index);
num_total_atoms=length(types);
total_nn1_N=12*num_total_atoms; % bcc = 8, fcc = 12

%% calculate SRO with central atom Fe
Fe_NN1_types_set= Fe_nn_type_set;
% Fe-Fe
Fe_Fe_index=find(Fe_NN1_types_set==1);
num_Fe_Fe=length(Fe_Fe_index);% each Ni-Ni pairs counted two times
P_Fe_Fe=num_Fe_Fe/(total_nn1_N);% probability of Ni-Ni pairs
SRO_Fe_Fe_NN1=1- P_Fe_Fe/(c_Fe*c_Fe);
% Fe-Ni
Fe_Ni_index=find(Fe_NN1_types_set==2);
num_Fe_Ni=length(Fe_Ni_index);% each Ni-Ni pairs counted two times
% P_Ni_Cr=num_Ni_Cr/(total_nn1_N/2);% probability of Ni-Co pairs
P_Fe_Ni=num_Fe_Ni/(total_nn1_N);
SRO_Fe_Ni_NN1=1- P_Fe_Ni/(c_Fe*c_Ni);
% Fe-Cr
Fe_Cr_index=find(Fe_NN1_types_set==3);
num_Fe_Cr=length(Fe_Cr_index);% each Ni-Ni pairs counted two times
% P_Ni_Cr=num_Ni_Cr/(total_nn1_N/2);% probability of Ni-Co pairs
P_Fe_Cr=num_Fe_Cr/(total_nn1_N);
SRO_Fe_Cr_NN1=1- P_Fe_Cr/(c_Fe*c_Cr);
% Fe-Co
Fe_Co_index=find(Fe_NN1_types_set==4);
num_Fe_Co=length(Fe_Co_index);% each Ni-Ni pairs counted two times
% P_Ni_Co=num_Ni_Co/(total_nn1_N/2);% probability of Ni-Co pairs, please go to the reference ppt for the formular
P_Fe_Co=num_Fe_Co/(total_nn1_N);
SRO_Fe_Co_NN1=1- P_Fe_Co/(c_Fe*c_Co);
% Fe-Al
Fe_Al_index=find(Fe_NN1_types_set==5);
num_Fe_Al=length(Fe_Al_index);% each Ni-Ni pairs counted two times
% P_Ni_Co=num_Ni_Co/(total_nn1_N/2);% probability of Ni-Co pairs, please go to the reference ppt for the formular
P_Fe_Al=num_Fe_Al/(total_nn1_N);
SRO_Fe_Al_NN1=1- P_Fe_Al/(c_Fe*c_Al);

%% calculate SRO with central atom Ni
Ni_NN1_types_set= Ni_nn_type_set;
%Ni-Ni
Ni_Ni_index=find(Ni_NN1_types_set==2);
num_Ni_Ni=length(Ni_Ni_index);% each Ni-Ni pairs counted two times
P_Ni_Ni=num_Ni_Ni/(total_nn1_N);% probability of Ni-Ni pairs
SRO_Ni_Ni_NN1=1- P_Ni_Ni/(c_Ni*c_Ni);
% Ni-Cr
Ni_Cr_index=find(Ni_NN1_types_set==3);
num_Ni_Cr=length(Ni_Cr_index);% each Ni-Ni pairs counted two times
% P_Ni_Cr=num_Ni_Cr/(total_nn1_N/2);% probability of Ni-Co pairs
P_Ni_Cr=num_Ni_Cr/(total_nn1_N);
SRO_Ni_Cr_NN1=1- P_Ni_Cr/(c_Ni*c_Cr);
% Ni-Co
Ni_Co_index=find(Ni_NN1_types_set==4);
num_Ni_Co=length(Ni_Co_index);% each Ni-Ni pairs counted two times
% P_Ni_Co=num_Ni_Co/(total_nn1_N/2);% probability of Ni-Co pairs, please go to the reference ppt for the formular
P_Ni_Co=num_Ni_Co/(total_nn1_N);
SRO_Ni_Co_NN1=1- P_Ni_Co/(c_Ni*c_Co);
% Ni-Al
Ni_Al_index=find(Ni_NN1_types_set==5);
num_Ni_Al=length(Ni_Al_index);% each Ni-Ni pairs counted two times
% P_Ni_Co=num_Ni_Co/(total_nn1_N/2);% probability of Ni-Co pairs, please go to the reference ppt for the formular
P_Ni_Al=num_Ni_Al/(total_nn1_N);
SRO_Ni_Al_NN1=1- P_Ni_Al/(c_Ni*c_Al);

%% calculate SRO with central atom Cr
Cr_NN1_types_set= Cr_nn_type_set;
%Cr-Cr
Cr_Cr_index=find(Cr_NN1_types_set==3);
num_Cr_Cr=length(Cr_Cr_index);% each Ni-Ni pairs counted two times
P_Cr_Cr=num_Cr_Cr/(total_nn1_N);% probability of Ni-Ni pairs
SRO_Cr_Cr_NN1=1- P_Cr_Cr/(c_Cr*c_Cr);
% Cr-Co
Cr_Co_index=find(Cr_NN1_types_set==4);
num_Cr_Co=length(Cr_Co_index);% each Ni-Ni pairs counted two times
P_Cr_Co=num_Cr_Co/(total_nn1_N);% probability of Ni-Co pairs
SRO_Cr_Co_NN1=1- P_Cr_Co/(c_Cr*c_Co);
% Cr-Al
Cr_Al_index=find(Cr_NN1_types_set==5);
num_Cr_Al=length(Cr_Al_index);% each Ni-Ni pairs counted two times
P_Cr_Al=num_Cr_Al/(total_nn1_N);% probability of Ni-Co pairs
SRO_Cr_Al_NN1=1- P_Cr_Al/(c_Cr*c_Al);

%% calculate SRO with central atom Co
Co_NN1_types_set= Co_nn_type_set;
%Co-Co
Co_Co_index=find(Co_NN1_types_set==4);
num_Co_Co=length(Co_Co_index);% each Ni-Ni pairs counted two times
P_Co_Co=num_Co_Co/(total_nn1_N);% probability of Ni-Ni pairs
SRO_Co_Co_NN1=1- P_Co_Co/(c_Co*c_Co);
% Co-Al
Co_Al_index=find(Co_NN1_types_set==5);
num_Co_Al=length(Co_Al_index);% each Ni-Ni pairs counted two times
P_Co_Al=num_Co_Al/(total_nn1_N);% probability of Ni-Co pairs
SRO_Co_Al_NN1=1- P_Co_Al/(c_Co*c_Al);

%% calculate SRO with central atom Al
Al_NN1_types_set= Al_nn_type_set;
%Al-Al
Al_Al_index=find(Al_NN1_types_set==5);
num_Al_Al=length(Al_Al_index);% each Al-Al pairs counted two times
P_Al_Al=num_Al_Al/(total_nn1_N);% probability of Al-Al pairs
SRO_Al_Al_NN1=1- P_Al_Al/(c_Al*c_Al);


%%
T= table(SRO_Fe_Fe_NN1,SRO_Fe_Ni_NN1,SRO_Fe_Cr_NN1,SRO_Fe_Co_NN1,SRO_Fe_Al_NN1,...
    SRO_Ni_Ni_NN1,SRO_Ni_Cr_NN1,SRO_Ni_Co_NN1,SRO_Ni_Al_NN1,...    
    SRO_Cr_Cr_NN1,SRO_Cr_Co_NN1,SRO_Cr_Al_NN1,...
    SRO_Co_Co_NN1,SRO_Co_Al_NN1,...
    SRO_Al_Al_NN1)

% Transpose the table
T_transpose = table(T.Properties.VariableNames', T.Variables', 'VariableNames', {'Title', 'Value'});

% Save table to text file
filename = 'wc_matlab.txt';
writetable(T_transpose, filename, 'Delimiter', '\t');

disp(['Table saved to ' filename]);


