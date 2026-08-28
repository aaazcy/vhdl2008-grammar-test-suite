-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::= protected protected_type_declarative_part end protected [ protected_type_simple_name ]
-- Case Type: Negative
-- Test Focus: Static model negative -- protected declaration end label
--            mismatch. The optional simple_name after end protected
--            does not match the declared type name. VHDL requires
--            the end label to match the type identifier.
-- Expected Result: Triggers static label mismatch error
-- Dependencies: None
-- =============================================================
entity pt_decl_smn_end_label_err is
  port ( dout : out integer );
end entity pt_decl_smn_end_label_err;
architecture rtl of pt_decl_smn_end_label_err is
  type t_holder is protected
    procedure set(x : integer);
  end protected t_wrong;  -- ERROR: label t_wrong != t_holder
  type t_holder is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_holder;
begin
  process begin sv.set(1); dout <= 0; wait; end process;
end architecture rtl;
