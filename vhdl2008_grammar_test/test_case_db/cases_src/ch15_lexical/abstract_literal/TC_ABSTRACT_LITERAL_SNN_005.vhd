-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: base of based_literal in abstract_literal beyond the 2-16 range(20#FF#): base value 20 is outside the 2 to 16 range allowed by VHDL, verify the parser/tool reports an illegal base error
-- Expected Result: Triggers error on base value out of allowed range
-- Dependencies: None
-- =============================================================
entity al_base_out_of_range is
  port (
    bad_val : out integer
  );
end entity al_base_out_of_range;

architecture rtl of al_base_out_of_range is
  constant C_BAD : integer := 20#FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
