-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::= { protected_type_body_declarative_item }
-- Case Type: Negative
-- Test Focus: Static model negative — protected body declarative part
--            contains a signal_declaration which is illegal in this context.
--            Only variable_declaration is permitted in a protected body;
--            signal_declaration is not a valid body_declarative_item.
-- Expected Result: Triggers static error — signal not allowed in protected body
-- Dependencies: None
-- =============================================================
entity pt_body_dp_smn_signal_err is
  port ( dout : out integer );
end entity pt_body_dp_smn_signal_err;
architecture rtl of pt_body_dp_smn_signal_err is
  type t_pt is protected
    impure function get return integer;
  end protected;
  type t_pt is protected body
    signal s_bad : integer := 0;   -- ERROR: signal not allowed in protected body
    impure function get return integer is begin return 0; end function;
  end protected body;
begin
  dout <= 0;
end architecture rtl;
