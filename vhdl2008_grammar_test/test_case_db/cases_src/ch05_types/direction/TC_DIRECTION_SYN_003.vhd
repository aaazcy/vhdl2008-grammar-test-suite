-- =============================================================
-- Case ID: TC_DIRECTION_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: "to" direction in FOR GENERATE statement. Instantiates
--   a linear chain of AND gates from bit 0 to 7 using ascending
--   generate index.
-- Expected Result: Compiles; chain output reflects AND of inputs
-- Dependencies: None
-- =============================================================
entity to_generate_chain is
  port (
    vec_in  : in  bit_vector(0 to 7);
    chain_out : out bit
  );
end entity to_generate_chain;

architecture generate_to of to_generate_chain is
  type t_wire is array(0 to 8) of bit;
  signal link : t_wire;
begin
  link(0) <= '1';
  gen_chain: for i in 0 to 7 generate
    link(i + 1) <= link(i) and vec_in(i);
  end generate;
  chain_out <= link(8);
end architecture generate_to;
