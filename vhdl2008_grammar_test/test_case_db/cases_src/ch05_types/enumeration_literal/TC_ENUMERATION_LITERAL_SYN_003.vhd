-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: Enumeration literals as VHDL identifiers used in
--            state machine encoding. Tests that enum literals like
--            IDLE, READ, WRITE are valid identifiers and can be
--            assigned, compared, and used in case statements.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_identifier_sm is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity enum_lit_identifier_sm;
architecture rtl of enum_lit_identifier_sm is
  type t_state is (IDLE, READ, WRITE, DONE);
  signal s_state : t_state := IDLE;
  signal s_count : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      case s_state is
        when IDLE => s_state <= READ;
        when READ => s_count <= s_count + 1; s_state <= WRITE;
        when WRITE => s_state <= DONE;
        when DONE => s_state <= IDLE;
      end case;
    end if;
  end process;
  dout <= s_count;
end architecture rtl;
