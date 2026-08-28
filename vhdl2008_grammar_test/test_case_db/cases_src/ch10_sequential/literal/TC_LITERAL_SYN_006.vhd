-- =============================================================
-- Case ID: TC_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: character literal as enumeration_literal used in case statement and comparison
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn6_ent is port(ch:in character; y:out integer); end entity;
architecture bh of literal_syn6_ent is
begin
  process(ch) is
  begin
    case ch is
      when 'A' => y<=1;
      when 'B' => y<=2;
      when 'C' => y<=3;
      when others => y<=0;
    end case;
  end process;
end architecture bh;
