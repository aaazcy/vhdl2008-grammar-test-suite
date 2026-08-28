-- =============================================================
-- Case ID: TC_INCOMPLETE_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: incomplete_type_declaration ::= type identifier ;
-- Case Type: Positive
-- Test Focus: Exercises incomplete_type_declaration for forward-declared record type used as a port element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity incomplete_type_decl_syn3 is
  port (
    clk : in bit;
    d   : in integer;
    q   : out integer
  );
end entity incomplete_type_decl_syn3;

architecture rtl of incomplete_type_decl_syn3 is
  type t_fifo_entry;
  type t_fifo_ptr is access t_fifo_entry;
  type t_fifo_entry is record
    value : integer;
    prev  : t_fifo_ptr;
  end record;
  signal s_stored : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_stored <= d;
      q <= s_stored;
    end if;
  end process;
end architecture rtl;
