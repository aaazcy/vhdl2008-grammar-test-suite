-- =============================================================
-- Case ID: TC_SEM_GENERIC_CLAUSE_SMN_001
-- Related Rule ID: SEM_GENERIC_CLAUSE_SMN_001
-- Rule Type: Semantic (Negative)
-- BNF Production: GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Test Focus: Semantic error — generic default value type mismatch. The
--   generic DELAY is declared as type time but given a default value of
--   integer literal "5" without units. VHDL requires time values to have
--   units (e.g., "5 ns"). This causes a semantic/type error because integer
--   is not compatible with time.
-- Case Type: Negative (Semantic)
-- Expected Result: Triggers semantic error (type mismatch: integer vs time)
-- Dependencies: None
-- =============================================================

-- ERROR: DELAY is type time but default value 5 is an integer literal
-- without time units. VHDL cannot implicitly convert integer to time.
entity pulse_gen is
  generic (
    DELAY : time := 5
  );
  port (
    clk    : in  bit;
    pulse  : out bit
  );
end entity pulse_gen;

architecture rtl of pulse_gen is
  signal s_count : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_count <= s_count + 1;
      if s_count = 0 then
        pulse <= '1';
      else
        pulse <= '0';
      end if;
    end if;
  end process;
end architecture rtl;
