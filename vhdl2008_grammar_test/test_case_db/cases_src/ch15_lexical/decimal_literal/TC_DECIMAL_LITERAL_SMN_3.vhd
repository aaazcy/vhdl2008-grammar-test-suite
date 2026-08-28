-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: decimal_literal with a fractional part used in a case choice expression — case choices require a discrete type, real literals cannot be used as choices
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity dec_lit_sem_002 is
  port (
    sel   : in  integer;
    match : out bit
  );
end entity dec_lit_sem_002;

architecture rtl of dec_lit_sem_002 is
begin
  process(sel)
  begin
    case sel is
      when 3.14 => match <= '1';
      when others => match <= '0';
    end case;
  end process;
end architecture rtl;
