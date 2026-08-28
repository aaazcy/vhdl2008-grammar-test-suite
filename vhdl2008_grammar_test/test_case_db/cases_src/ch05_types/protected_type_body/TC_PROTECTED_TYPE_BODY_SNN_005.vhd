-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SNN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::= protected body protected_type_body_declarative_part end protected body [ protected_type_simple_name ]
-- Case Type: Negative
-- Test Focus: protected type body missing the 'body' keyword after
--            'protected'. The syntax requires 'protected body' to
--            introduce the body part. Without 'body' the parser
--            sees a malformed construct.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pt_body_snn_missing_body is
end entity pt_body_snn_missing_body;
architecture rtl of pt_body_snn_missing_body is
  type t_pt is protected
    procedure set(x : integer);
  end protected;
  type t_pt is protected               -- ERROR: missing 'body' keyword
    variable v : integer := 0;
  end protected body;
begin
end architecture rtl;
