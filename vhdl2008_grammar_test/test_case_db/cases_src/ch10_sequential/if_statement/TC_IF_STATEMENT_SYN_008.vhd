-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: Labeled if-statement with three elsif branches where each then body contains multiple sequential statements — condition checks a 2-bit opcode `cmd` via equality; each branch assigns `val_a`, `val_b`, and issues a `report`; the `end if` repeats the label `L_decode` verifying label-match syntax; demonstrates multi-statement branch bodies driven by a discrete opcode with all conditional arms producing side effects
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_decode_cmd_ent is port(
  cmd   : in  bit_vector(1 downto 0);
  val_a : out integer range 0 to 15;
  val_b : out integer range 0 to 15
); end entity;
architecture bh of if_decode_cmd_ent is
begin
  process(cmd) begin
    L_decode: if cmd = "00" then
      val_a <= 0; val_b <= 0;
      report "IDLE" severity note;
    elsif cmd = "01" then
      val_a <= 1; val_b <= 2;
      report "LOAD" severity note;
    elsif cmd = "10" then
      val_a <= 3; val_b <= 4;
      report "ADD" severity note;
    elsif cmd = "11" then
      val_a <= 5; val_b <= 6;
      report "STORE" severity note;
    else
      val_a <= 0; val_b <= 0;
    end if L_decode;
  end process;
end architecture bh;
