-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: positional association call: `write_fifo(data, addr);` — mapping actuals to formals in positional order, verifying parameter passing via positional association
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity proc_call_pos_ent is
  port (
    wr_data : in  integer range 0 to 255;
    wr_addr : in  integer range 0 to 15;
    wr_en   : in  bit
  );
end entity proc_call_pos_ent;

architecture rtl of proc_call_pos_ent is
  type t_mem is array (0 to 15) of integer range 0 to 255;
  signal s_mem : t_mem := (others => 0);
begin
  process(wr_data, wr_addr, wr_en) is
    procedure write_mem(
      data  : in  integer range 0 to 255;
      addr  : in  integer range 0 to 15;
      en    : in  bit
    ) is
    begin
      if en = '1' then
        s_mem(addr) <= data;
      end if;
    end procedure;
  begin
    write_mem(wr_data, wr_addr, wr_en);  -- positional association
  end process;
end architecture rtl;
