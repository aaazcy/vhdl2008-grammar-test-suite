-- =============================================================
-- Case ID: TC_LITERAL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Positive
-- Test Focus: literal: enumeration_literal (bit '1'/'0') and string_literal in conditional context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity literal_syn2_ent is port(sel:in bit; y_str:out string(1 to 4); y_bit:out bit); end entity;
architecture bh of literal_syn2_ent is
begin
  process(sel) is
  begin
    if sel='1' then y_str<="PASS"; y_bit<='1';
    else y_str<="FAIL"; y_bit<='0';
    end if;
  end process;
end architecture bh;
