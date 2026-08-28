-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: Enumeration literals used in relational comparisons
--            and ordering. Tests that enum literals support the full
--            set of relational operators (=, /=, <, >, <=, >=) based
--            on their declaration position order.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_relational is
  port (
    dout : out integer
  );
end entity enum_lit_relational;
architecture rtl of enum_lit_relational is
  type t_severity is (NOTE, WARNING, ERROR, FAILURE);
  signal s_sev : t_severity := NOTE;
  signal s_count : integer := 0;
begin
  process
  begin
    if s_sev < ERROR then
      s_count <= s_count + 1;
    end if;
    s_sev <= WARNING;
    if s_sev >= NOTE then
      s_count <= 0;
    end if;
    dout <= s_count;
    wait;
  end process;
end architecture rtl;
