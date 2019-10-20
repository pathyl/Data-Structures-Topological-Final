{initialization}
Get the number of actions, NA;
For K in 1 .. NA begin  Count[K] <- 0;  Top[K] <- null;  end;
Set KN <- NA where KN is the number of actions still to be processed.



Get the first relation J < K.
Repeat
	Increase Count[K] by one;
	Set P <= Avail;  P.Suc <- K;  
	Set P.Next <- Top[J];  Top[J] <- P;

until out of transactions in the input.

3)	{Initialize the output queue by linking all Qlink[k] where Count[k] = 0.  Count [k] = 0 indicates no task must precede the task K in the output.}
Set R <- 0 and Qlink[0] <- 0;
for K in 1 .. NA loop
	If Count[K] = 0 then
		Qlink[R] <- K;  R <- K;
	end if;
end loop;
F <- Qlink[0];

4)	While F not = 0 loop
		Perform action F. {write it in the output}
		Set KN <- KN - 1;  P <- Top[F];  Top[F] <- 0;
		{Top[I] points to all relations not yet cancelled, 1 <= I <= NA}
		While P not = 0 loop
			Count[Suc(P)] = Count[Suc(P)] - 1;
			If Count[Suc(P)] = 0 then
				Qlink[R] <- Suc[P]; {add to output queue}
				R <- Suc[P]
			end if
			P <- Next[P];
		end loop;
		F <- Qlink[F];
	end loop;
	

5)	If KN = 0 then
the topological sort has been completed successfully.  All actions have been printed in the output stream.
	else
{If KN is not equal to zero, then the relations have violated the hypothesis for a partial order, i.e., the relations contain a loop.  We need to print the loop}

For K in 1.. NA loop
	QLink[K] <- 0
end loop
