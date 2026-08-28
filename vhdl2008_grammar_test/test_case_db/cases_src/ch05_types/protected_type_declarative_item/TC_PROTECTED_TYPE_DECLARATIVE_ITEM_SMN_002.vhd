-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | attribute_specification | use_clause
-- Case Type: Negative
-- Test Focus: Static model negative -- variable_declaration is not an
--            allowed item in the protected type declarative part.
--            Only subprogram declarations, subprogram instantiations,
--            attribute specifications, and use clauses are permitted.
--            A variable declaration here violates the grammar.
-- Expected Result: Triggers static error
-- Dependencies: None
-- =============================================================
entity pt_di_smn_var_in_decl is
  port ( dout : out integer );
end entity pt_di_smn_var_in_decl;
architecture rtl of pt_di_smn_var_in_decl is
  type t_pt is protected
    variable v_bad : integer := 0;   -- ERROR: variable not allowed in declarative part
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
begin
  dout <= 0;
end architecture rtl;
