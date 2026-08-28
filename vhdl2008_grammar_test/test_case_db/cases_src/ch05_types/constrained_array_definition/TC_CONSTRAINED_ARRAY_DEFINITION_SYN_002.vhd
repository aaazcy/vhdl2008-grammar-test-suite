-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Constrained array with descending range as a hardware
--            stack. index_constraint uses "downto" direction.
--            Models a call/return stack for a simple CPU.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity hardware_stack is
  port (
    clk    : in  bit;
    push   : in  bit;
    pop    : in  bit;
    data_i : in  integer range 0 to 1023;
    data_o : out integer range 0 to 1023;
    empty  : out bit
  );
end entity hardware_stack;

architecture rtl of hardware_stack is
  -- constrained_array_definition: descending index_constraint
  type stack_mem is array (7 downto 0) of integer range 0 to 1023;
  signal stack : stack_mem := (others => 0);
  signal sp    : integer range 0 to 7 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if push = '1' and sp < 7 then
        stack(sp) <= data_i;
        sp <= sp + 1;
      elsif pop = '1' and sp > 0 then
        sp <= sp - 1;
      end if;
      data_o <= stack(sp);
    end if;
  end process;
  empty <= '1' when sp = 0 else '0';
end architecture rtl;
