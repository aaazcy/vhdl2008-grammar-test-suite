-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROTECTED_TYPE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::= { protected_type_declarative_item }
-- Case Type: Negative
-- Test Focus: Syntax error -- protected declarative part missing the
--            required 'protected' keyword to begin the declaration.
--            The body is present but the declaration section is
--            syntactically empty or malformed.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_dp_snn_missing_protected is
end entity pt_dp_snn_missing_protected;
architecture rtl of pt_dp_snn_missing_protected is
  type t_pt is             -- ERROR: missing 'protected' keyword
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
begin
end architecture rtl;
