-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: SEMANTIC -- enum literal values used as array index
--            via the position attribute. Tests that the semantic
--            position mapping of enum literals to integers is
--            correct and usable for array indexing.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_sem_position is
  port (
    dout : out integer
  );
end entity enum_lit_sem_position;
architecture rtl of enum_lit_sem_position is
  type t_color is (RED, GREEN, BLUE);
  type t_rgb is array (t_color) of integer range 0 to 255;
  signal s_rgb : t_rgb := (RED => 0, GREEN => 0, BLUE => 0);
begin
  process
  begin
    s_rgb(RED) <= 255;
    s_rgb(GREEN) <= 128;
    s_rgb(BLUE) <= 64;
    dout <= s_rgb(RED) + s_rgb(GREEN) + s_rgb(BLUE);
    wait;
  end process;
end architecture rtl;
