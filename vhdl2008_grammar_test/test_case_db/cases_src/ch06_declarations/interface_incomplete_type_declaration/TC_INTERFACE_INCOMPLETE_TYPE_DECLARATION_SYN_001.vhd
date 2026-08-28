-- =============================================================
-- Case ID: TC_INTERFACE_INCOMPLETE_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Production: interface_incomplete_type_declaration ::= type identifier
-- Case Type: Positive
-- Test Focus: Exercises interface_incomplete_type_declaration as a type generic in a pipelined processing entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_incomplete_type_syn1 is
  generic (
    type t_payload
  );
  port (
    clk    : in  bit;
    data   : in  integer;
    result : out integer
  );
end entity interface_incomplete_type_syn1;

architecture rtl of interface_incomplete_type_syn1 is
  signal s_pipe : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_pipe <= data;
      result <= s_pipe;
    end if;
  end process;
end architecture rtl;
