-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SMN_002
-- Related Rule ID: SMN_PROTECTE_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::= protected_type_declaration | protected_type_body
-- Case Type: Negative
-- Test Focus: Static model negative -- protected type definition with
--            body but no declaration. The body cannot exist without a
--            corresponding protected_type_declaration to define the
--            method interface.
-- Expected Result: Triggers static error -- body without declaration
-- Dependencies: None
-- =============================================================
entity pt_def_smn_body_only is
  port ( dout : out integer );
end entity pt_def_smn_body_only;
architecture rtl of pt_def_smn_body_only is
  type t_orphan is protected body       -- ERROR: body without preceding declaration
    variable v : integer := 0;
  end protected body;
begin
  dout <= 0;
end architecture rtl;
