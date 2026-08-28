-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SMN_2
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::= { protected_type_body_declarative_item }
-- Test Focus: SEMANTIC — protected_type_body_declarative_part contains a signal declaration s_illegal, but signal_declaration is not among the allowed protected_type_body_declarative_item alternatives
-- Case Type: Negative
-- Expected Result: Triggers semantic error: signal declaration not allowed in protected type
-- =============================================================
entity pt34_ent is
  port ( dout : out integer );
end entity pt34_ent;
architecture rtl of pt34_ent is
  type t_pt is protected
    procedure inc;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    signal s_illegal : bit := '0';
    procedure inc is begin v := v + 1; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  dout <= 0;
end architecture rtl;
