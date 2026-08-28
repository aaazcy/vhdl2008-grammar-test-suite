-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::= { protected_type_declarative_item }
-- Case Type: Negative
-- Test Focus: Static model negative -- type_declaration in protected
--            declarative part. Type declarations are not valid
--            protected_type_declarative_items; they belong in the body.
-- Expected Result: Triggers static error
-- Dependencies: None
-- =============================================================
entity pt_dp_smn_type_in_decl is
  port ( dout : out integer );
end entity pt_dp_smn_type_in_decl;
architecture rtl of pt_dp_smn_type_in_decl is
  type t_pt is protected
    type t_inner is range 0 to 255;  -- ERROR: type_decl not in declarative_item list
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
begin
  dout <= 0;
end architecture rtl;
